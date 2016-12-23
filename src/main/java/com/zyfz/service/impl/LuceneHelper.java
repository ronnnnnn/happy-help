package com.zyfz.service.impl;

import com.zyfz.dao.ServerInfoMapper;
import com.zyfz.domain.ServerInfo;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.index.*;
import org.apache.lucene.index.IndexWriterConfig.OpenMode;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.*;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.springframework.stereotype.Service;
import org.wltea.analyzer.lucene.IKAnalyzer;
import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


/**
 * Created by ron on 16-12-22.
 */
@Service
public class LuceneHelper {

    @Resource
    ServerInfoMapper serverInfoMapper;

    private static boolean insertFlag = true;
    private static final Version version = Version.LUCENE_44;

    protected int getHitCount(String filedName,String searchString) {
        Directory directory = null;
        IndexReader reader = null;
        try {
            directory =  FSDirectory.open(new File("/var/www/files/searchIndex"));
            reader = DirectoryReader.open(directory);
            IndexSearcher searcher = new IndexSearcher(reader);
            Term term = new Term(filedName,searchString);
            Query query = new TermQuery(term);
            int hitCount = hitCount(searcher, query);
            reader.close();
            directory.close();
            return hitCount;
        }catch (Exception e){
            return 0;
        } finally {
            try {
                if (directory != null) {
                    directory.close();
                }
                if (reader != null ) {
                    reader.close();
                }
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static int hitCount(IndexSearcher searcher,Query query) throws IOException{
        TopDocs search = searcher.search(query,1);
        return search.totalHits;
    }



    public void updateOrInsert(ServerInfo serverInfo) throws Exception{
        Integer flag = getHitCount("id",String.valueOf(serverInfo.getId()));
        Directory directory =  null;
        Analyzer analyzer = null;
        IndexWriter iwriter = null;
        try {
            directory =  FSDirectory.open(new File("/var/www/files/searchIndex"));
            analyzer = new IKAnalyzer();
            IndexWriterConfig conf = new IndexWriterConfig(Version.LUCENE_44,
                    analyzer);
            conf.setOpenMode(OpenMode.CREATE_OR_APPEND);
            iwriter = new IndexWriter(directory, conf);
            if (flag == 0){
                iwriter.addDocument(doncumentInvalid(serverInfo));
            } else {
                iwriter.updateDocument(new Term("id",String.valueOf(serverInfo.getId())),doncumentInvalid(serverInfo));
            }
            iwriter.close();
            directory.close();
            analyzer.close();

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (iwriter != null) {
                    iwriter.close();
                }
                if (directory != null){
                    directory.close();
                }
                if (analyzer != null){
                    analyzer.close();
                }
            } catch (CorruptIndexException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    private Document doncumentInvalid(ServerInfo serverInfo){

        Document document = new Document();
        document.add(new StringField("id",String.valueOf(serverInfo.getId()),
                Field.Store.YES));
        if (serverInfo.getContext() != null){
            document.add(new Field("context", serverInfo.getContext(), Field.Store.YES,
                    Field.Index.ANALYZED));
        }
        if (serverInfo.getAddress() != null) {
            document.add(new Field("address", serverInfo.getAddress(), Field.Store.YES,
                    Field.Index.ANALYZED));
        }
        if (serverInfo.getArea() != null) {
            document.add(new Field("area", serverInfo.getArea(), Field.Store.YES,
                    Field.Index.ANALYZED));
        }
        if (serverInfo.getCity() != null) {
            document.add(new Field("city", serverInfo.getCity(), Field.Store.YES,
                    Field.Index.ANALYZED));
        }
        if (serverInfo.getStreet() != null) {
            document.add(new Field("street", serverInfo.getStreet(), Field.Store.YES,
                    Field.Index.ANALYZED));
        }
        if (serverInfo.getProvince() != null) {
            document.add(new Field("province", serverInfo.getProvince(), Field.Store.YES,
                    Field.Index.ANALYZED));
        }

        return document;
    }

    public void deleteAllIndex(){
        Directory directory = null;
        IndexWriter writer = null;
        Analyzer analyzer = null;
        try {
            directory =  FSDirectory.open(new File("/var/www/files/searchIndex"));
            analyzer = new IKAnalyzer();
            IndexWriterConfig conf = new IndexWriterConfig(Version.LUCENE_44,
                    analyzer);
            conf.setOpenMode(OpenMode.CREATE_OR_APPEND);
            writer = new IndexWriter(directory, conf);
            writer.deleteAll();
            writer.commit();
            writer.close();
            directory.close();
            analyzer.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (writer != null) {
                    writer.close();
                }
                if (directory != null){
                    directory.close();
                }
                if (analyzer != null){
                    analyzer.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    /**
     * 创建索引
     * @throws SQLException
     * @throws ClassNotFoundException
     * @throws IOException
     */
    public void index() throws SQLException, ClassNotFoundException, IOException {
        Directory directory =  FSDirectory.open(new File("/var/www/files/searchIndex"));
        IndexWriter writer = null;
        Analyzer analyzer = null;
        try {
            analyzer = new IKAnalyzer();
            IndexWriterConfig conf = new IndexWriterConfig(Version.LUCENE_44,
                    analyzer);
            conf.setOpenMode(OpenMode.CREATE_OR_APPEND);
            writer = new IndexWriter(directory, conf);
            insertFlag = false;

            List<ServerInfo> serverInfos = serverInfoMapper.selectAll();
            for (ServerInfo serverInfo : serverInfos){
                writer.addDocument(doncumentInvalid(serverInfo));
            }
            writer.close();
            directory.close();
            analyzer.close();
        } catch (Exception e){
           e.printStackTrace();
        } finally {
            try {

                if (writer != null) {
                    writer.close();
                }
                if (directory != null){
                    directory.close();
                }
                if (analyzer != null){
                    analyzer.close();
                }

            } catch (CorruptIndexException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


//    public IndexSearcher getSearcher() throws IOException {
//        IndexReader reader = DirectoryReader.open(directory);
//        IndexSearcher searcher = new IndexSearcher(reader);
//        return searcher;
//    }

//    public List<String> searchByTerm(String field, String value, int num) throws IOException {
//        List<String> ids = new ArrayList<String>();
//        IndexSearcher searcher = getSearcher();
//        // WildcardQuery 模糊查找
//        // TermQuery 精确查找
//        Query query = new WildcardQuery(new Term(field, value));
//        TopDocs tds = searcher.search(query, num);
//        System.out.println("count:" + tds.totalHits);
//        for (ScoreDoc sd : tds.scoreDocs) {
//            Document doc = searcher.doc(sd.doc);
//            System.out.println("id:" + doc.get("id"));
//            System.out.println("area:" + doc.get("area"));
//            System.out.println("city:" + doc.get("city"));
//            ids.add(doc.get("id"));
//        }
//        return ids;
//    }

    /**
     * 查看IKAnalyzer 分词器是如何将一个完整的词组进行分词的
     *
     * @param text
     * @param isMaxWordLength
     */
    public void splitWord(String text, boolean isMaxWordLength) {
        try {
            // 创建分词对象
            Analyzer analyzer = new IKAnalyzer(isMaxWordLength);
            StringReader reader = new StringReader(text);
            // 分词
            TokenStream ts = analyzer.tokenStream("", reader);
            CharTermAttribute term = ts.getAttribute(CharTermAttribute.class);
            // 遍历分词数据
            System.out.print("IKAnalyzer把关键字拆分的结果是：");
            while (ts.incrementToken()) {
                System.out.print("【" + term.toString() + "】");
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println();
    }

    /**
     * 根据关键字实现全文检索
     */
    public Set<String> searchIndexFile(String keyword) {
        long startTime = System.currentTimeMillis();
        System.out.println("*****************查询索引开始**********************");
        IndexReader reader = null;
        IndexSearcher indexSearcher = null;
        Directory directory = null;
        Analyzer analyzer = null;
        Set<String> ids = new HashSet<String>();
        try {
            directory =  FSDirectory.open(new File("/var/www/files/searchIndex"));
            reader = DirectoryReader.open(directory);
            indexSearcher = new IndexSearcher(reader);
            // 创建一个排序对象，其中SortField构造方法中，第一个是排序的字段，第二个是指定字段的类型，第三个是是否升序排列，true：升序，false：降序。
            Sort sort = new Sort(new SortField[] {new SortField("id", SortField.Type.STRING, false),new SortField("context", SortField.Type.STRING, false) });
            //Sort sort = new Sort();
            // 创建搜索类
            // 下面是创建QueryParser 查询解析器
            // QueryParser支持单个字段的查询，但是MultiFieldQueryParser可以支持多个字段查询，建议用后者这样可以实现全文检索的功能。
            // QueryParser queryParser = new QueryParser(Version.LUCENE_36, "title", analyzer);
            analyzer = new IKAnalyzer(true);
            QueryParser queryParser = new MultiFieldQueryParser(Version.LUCENE_44, new String[] {"context","province","city","area","street","address"},analyzer);
            // 利用queryParser解析传递过来的检索关键字，完成Query对象的封装
            Query query = queryParser.parse(keyword);
            splitWord(keyword, true); // 显示拆分结果
            // 执行检索操作

            TopDocs topDocs = indexSearcher.search(query, 5, sort);
            System.out.println("一共查到:" + topDocs.totalHits + "记录");
            ScoreDoc[] scoreDoc = topDocs.scoreDocs;

            for (int i = 0; i < scoreDoc.length; i++) {
                // 内部编号 ,和数据库表中的唯一标识列一样
                int doc = scoreDoc[i].doc;
                // 根据文档id找到文档
                Document mydoc = indexSearcher.doc(doc);

                String id = mydoc.get("id");
                String title = mydoc.get("area");
                String content = mydoc.get("context");
                TokenStream tokenStream = null;
                ids.add(id);
            }
            reader.close();
            directory.close();
            analyzer.close();
        } catch (CorruptIndexException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }finally {
            try {
                if (reader != null){
                    reader.close();
                }
                if (directory != null){
                    directory.close();
                }
                if (analyzer != null){
                    analyzer.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        System.out.println("根据关键字" + keyword + "检索到的结果如下：");
        long endTime = System.currentTimeMillis();
        System.out.println("全文索引文件成功，总共花费" + (endTime - startTime) + "毫秒。");
        System.out.println("*****************查询索引结束**********************");
        return  ids;
    }

}
