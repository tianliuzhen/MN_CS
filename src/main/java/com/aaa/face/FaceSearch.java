package com.aaa.face;


import com.baidu.ai.aip.utils.HttpUtil;
import com.baidu.ai.aip.utils.GsonUtils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

import sun.misc.BASE64Encoder;

/**
* ��������
*/
public class FaceSearch {

    /**
    * ��Ҫ��ʾ���������蹤����
    * FileUtil,Base64Util,HttpUtil,GsonUtils���
    * https://ai.baidu.com/file/658A35ABAB2D404FBF903F64D47C1F72
    * https://ai.baidu.com/file/C8D81F3301E24D2892968F09AE1AD6E2
    * https://ai.baidu.com/file/544D677F5D4E4F17B4122FBD60DB82B3
    * https://ai.baidu.com/file/470B3ACCA3FE43788B5A963BF0B625F3
    * ����
    */
    public static String search(String loginBase) {
        // ����url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/search";
        try {
        	// String imgParam=GetImageStr();//��ȡbase64��ͼƬͼƬ����
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("image", loginBase);
            map.put("liveness_control", "NONE"); 	//���������
            map.put("group_id_list", "tianliuzhenTestFace,group_repeat"); //��ָ����group�н��в��� �ö��ŷָ�������10��
            map.put("image_type", "BASE64");
            map.put("quality_control", "LOW");
          //  map.put("user_id", "zhang");//����Ҫ���ض��û����бȶ�ʱ��ָ��user_id���бȶԡ���������֤���ܡ�

            String param = GsonUtils.toJson(map);
            
            
            
            AuthService as=new AuthService();
            
            String accessToken = as.getToken();
            // ע�������Ϊ�˼򻯱���ÿһ������ȥ��ȡaccess_token�����ϻ���access_token�й���ʱ�䣬 �ͻ��˿����л��棬���ں����»�ȡ��

            String result = HttpUtil.post(url, accessToken, "application/json", param);
            System.out.println(result);
            
            
          
            
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        FaceSearch.search("");
    }
    //ģ��ͼƬת��base64
    public static  String GetImageStr()
    {//��ͼƬ�ļ�ת��Ϊ�ֽ������ַ����������Base64���봦��
        String imgFile = "C:\\java\\xxx2.jpg";//�����ͼƬ
        InputStream in = null;
        byte[] data = null;
        //��ȡͼƬ�ֽ�����
        try
        {
            in = new FileInputStream(imgFile);
            data = new byte[in.available()];
            in.read(data);
            in.close();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        //���ֽ�����Base64����
        BASE64Encoder encoder = new BASE64Encoder();
        return encoder.encode(data);//����Base64�������ֽ������ַ�
    }
}