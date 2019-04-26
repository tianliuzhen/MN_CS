package com.aaa.face;

import com.baidu.ai.aip.utils.Base64Util;
import com.baidu.ai.aip.utils.HttpUtil;
import com.baidu.ai.aip.utils.GsonUtils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.*;

import javax.servlet.Servlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import sun.misc.BASE64Encoder;


/**
* ����ע��
*/
public class FaceAdd {

    /**
    * ��Ҫ��ʾ���������蹤����
    * FileUtil,Base64Util,HttpUtil,GsonUtils���
    * https://ai.baidu.com/file/658A35ABAB2D404FBF903F64D47C1F72
    * https://ai.baidu.com/file/C8D81F3301E24D2892968F09AE1AD6E2
    * https://ai.baidu.com/file/544D677F5D4E4F17B4122FBD60DB82B3
    * https://ai.baidu.com/file/470B3ACCA3FE43788B5A963BF0B625F3
    * ����
    */

    public static String add(String regiterBase,String user_id) {
    	
        // ����url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/faceset/user/add";
        try {
			// �����ļ�·��
    //     String imgParam=GetImageStr();//��ȡbase64��ͼƬͼƬ����
            // ע�������ͼƬ��ʽ��
            System.out.println("imgParam:" + regiterBase);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("image",regiterBase );
            map.put("group_id", "tianliuzhenTestFace");
            map.put("user_id", user_id);
            map.put("user_info", "face");
            map.put("liveness_control", "NONE");
            map.put("image_type", "BASE64");
            map.put("quality_control", "LOW");

            String param = GsonUtils.toJson(map);

            // ע�������Ϊ�˼򻯱���ÿһ������ȥ��ȡaccess_token�����ϻ���access_token�й���ʱ�䣬 �ͻ��˿����л��棬���ں����»�ȡ��
   
      /*  ���� user_id  �û�id�������֡���ĸ���»�����ɣ�����������128B
       *  ���� user_info   ���û����ϣ���������48B Ĭ�Ͽ�
       *  ����group_id   �û���id����ʶһ���û��������֡���ĸ���»�����ɣ�����������48B��
       *  ��Ʒ���飺������ҵ�����󣬿��Խ���Ҫע����û�������ҵ�񻮷֣����䵽��ͬ��group�£����簴�ջ�Ա�ֻ�β����Ϊgroupid��
       *  ����ˢ��֧������Ա�Ʒ���ѵȣ�������Ծ����ܿ���ÿ��group�µ��û��������������������׼ȷ��
       *  
       *  ����image  ͼƬ��Ϣ(����ݴ�СӦС��10M)��ͼƬ�ϴ���ʽ���image_type���ж�
       *  ���� image_type   ͼƬ����
       *    BASE64:ͼƬ��base64ֵ��base64������ͼƬ��ݣ�������ͼƬ��С������2M��
            URL:ͼƬ�� URL��ַ( �������������ԭ��������ͼƬʱ���)��
            FACE_TOKEN������ͼƬ��Ψһ��ʶ�������������ӿ�ʱ����Ϊÿ������ͼƬ����һ��Ψһ��FACE_TOKEN��ͬһ��ͼƬ��μ��õ���FACE_TOKEN��ͬһ����
                      
                            ����  quality_control��ͼƬ��������
             NONE: �����п���
             LOW:�ϵ͵�����Ҫ��
             NORMAL: һ�������Ҫ��
             HIGH: �ϸߵ�����Ҫ��
                                  Ĭ�� NONE
                               ��ͼƬ����������Ҫ���򷵻ؽ���л���ʾ�������ʧ��
      *
      *
      *  ���� liveness_control��  ���������
          NONE: �����п���
           LOW:�ϵ͵Ļ���Ҫ��(��ͨ���� �͹����ܾ���)
          NORMAL: һ��Ļ���Ҫ��(ƽ��Ĺ����ܾ���, ͨ����)
          HIGH: �ϸߵĻ���Ҫ��(�߹����ܾ��� ��ͨ����)
                        Ĭ��NONE
                        ��������������Ҫ���򷵻ؽ���л���ʾ������ʧ��
       */ 
            
         /*  
          * ���ak��sk��ȡtoken
          *  ����ֱ�ӵ���   AuthService
          *  
          *  */
            AuthService as=new AuthService();
         
            String accessToken = as.getToken();

            String result = HttpUtil.post(url, accessToken, "application/json", param);
            
            System.out.println(result);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        FaceAdd.add("","");
    }
    
    
    //ģ��ͼƬת��base64
    public static  String GetImageStr()
    {//��ͼƬ�ļ�ת��Ϊ�ֽ������ַ����������Base64���봦��
        String imgFile = "C:\\工作空间\\zyq.jpg";//�����ͼƬ
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