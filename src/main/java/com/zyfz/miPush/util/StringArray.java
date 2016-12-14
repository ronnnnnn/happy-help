package com.zyfz.miPush.util;



import java.util.*;
import java.util.Map.Entry;
/**
 * Created by ron on 16-12-14.
 */
public class StringArray {
    // 求两个字符串数组的并集，利用set的元素唯一性
    public static String[] union(String[] arr1, String[] arr2)
    {
        Set<String> set = new HashSet<String>();
        for (String str : arr1)
        {
            set.add(str);
        }
        for (String str : arr2)
        {
            set.add(str);
        }
        String[] result = {};
        return set.toArray(result);
    }

    // 求两个数组的交集
    public static String[] intersect(String[] arr1, String[] arr2)
    {
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        List<String> list = new ArrayList<String>();
        for (String str : arr1)
        {
            if (!map.containsKey(str))
            {
                map.put(str, Boolean.FALSE);
            }
        }
        for (String str : arr2)
        {
            if (map.containsKey(str))
            {
                map.put(str, Boolean.TRUE);
            }
        }

        for (Iterator<Entry<String, Boolean>> it = map.entrySet().iterator();it.hasNext();)
        {
            Entry<String,Boolean> e = (Entry<String,Boolean>)it.next();
            if (e.getValue().equals(Boolean.TRUE))
            {
                list.add(e.getKey());
            }
        }
        return list.toArray(new String[] {});
    }

    public static Boolean hasIntersect(String[] arr1, String[] arr2){
        if (intersect(arr1,arr2).length > 0){
            return true;
        }else {
            return false;
        }
    }

    public static boolean hasIntersectV2(String[] arr, String targetValue) {
        Set<String> set = new HashSet<String>(Arrays.asList(arr));
        return set.contains(targetValue);
    }

}
