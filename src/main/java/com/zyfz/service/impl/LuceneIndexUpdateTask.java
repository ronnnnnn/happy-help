package com.zyfz.service.impl;

import com.zyfz.domain.ServerInfo;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * Created by ron on 16-12-23.
 */

@Scope("prototype")
public class LuceneIndexUpdateTask implements Runnable {
    private ServerInfo serverInfo;
    private LuceneHelper luceneHelper;

    public LuceneIndexUpdateTask(ServerInfo serverInfo,LuceneHelper luceneHelper){
        this.serverInfo = serverInfo;
        this.luceneHelper = luceneHelper;
    }

    @Override
    public void run() {
        try {
            luceneHelper.updateOrInsert(serverInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
