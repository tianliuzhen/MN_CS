package com.aaa.face;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

@Controller
public class faceControler {
	@RequestMapping("/faceRegister")
	public String billshow(Model model,HttpServletRequest request){
		model.addAttribute("list", "aaa123");
	
	String 	imgStr =request.getParameter("base");
			//System.out.println(imgStr);
		
			FaceAdd.add(imgStr,"");
			
			
			
    	System.out.print("�Ѿ��յ��˰��ֽ���ת��ΪͼƬ�ķ���");
    	//���ֽ������ַ����Base64���벢���ͼƬ
        if (imgStr == null) //ͼ�����Ϊ��
            return "";
        
        BASE64Decoder decoder = new BASE64Decoder();
        try
        {
            //Base64����
            byte[] b = decoder.decodeBuffer(imgStr);
            for(int i=0;i<b.length;++i)
            {
                if(b[i]<0)
                {//�����쳣���
                    b[i]+=256;
                }
            }
            //���jpegͼƬ
            String imagePath="c:";
            //���������ֹ�ظ�
      	  String newName=UUID.randomUUID()+".jpg";
            String contexPath= request.getSession().getServletContext().getRealPath("/zw")+newName;
            System.out.println(contexPath);
            OutputStream out = new FileOutputStream(contexPath);
            out.write(b);
            out.flush();
            out.close();
        }
        catch (Exception e)
        {
        }
		
		
		return null;
		
	}
	@RequestMapping("/facelogin")
	@ResponseBody
	public String login(Model model,HttpServletRequest request,HttpSession httpSession){
		System.out.println("login");
		try {
			
		
	 String Loginbase=	 request.getParameter("LoginBase");
	String  result=	FaceSearch.search(Loginbase);
		
	//{"error_code":0,"error_msg":"SUCCESS","log_id":7945796520179,"timestamp":1537686937,"cached":0,
	//"result":{"face_token":"54a88554fcad051e20ffce4cb25d09b0",
	//"user_list":[{"group_id":"tianliuzhenTestFace","user_id":"tian","user_info":"abc","score":95.83634185791}]}}
	
	com.alibaba.fastjson.JSONObject resObject1=JSON.parseObject(result);  // 1. 把json字符串解析为 java对象
	
	System.out.println(resObject1.get("error_msg")); //2. 获取第一层 json返回验证的结果
	System.out.println(resObject1.get("result"));
	
	com.alibaba.fastjson.JSONObject resObject2=JSON.parseObject(resObject1.get("result").toString()); 
                                                   //3.获取第二层  result
	System.out.println(resObject2.get("face_token"));
	System.out.println(resObject2.get("user_list"));
	
	com.alibaba.fastjson.JSONArray user_listJsonArray=JSON.parseArray(resObject2.get("user_list").toString()); 
	                                              //4.将 第三层user_list json 数据result  转成json数组
	System.out.println(user_listJsonArray.size());
	System.out.println(user_listJsonArray.get(0));
	
	com.alibaba.fastjson.JSONObject resObject3=JSON.parseObject(user_listJsonArray.get(0).toString()); 
	                                            //5. 把user_listJsonArray.get(0) 再次变一个java对象
	System.out.println(resObject3.get("score")); 
	
	System.out.println(resObject3.get("user_id"));
		
	int  	score=Integer.parseInt(String.valueOf(resObject3.get("score")).substring(0, 2));
		if (score>=90) {
			System.out.println("已通过");
			httpSession.setAttribute("ocnamefaceId",resObject3.get("user_id"));
			return "true";
		}else{
			System.err.println("未通过");
			return "false";
		}
		  
		 
		} catch (Exception e) {
			return "false";
		}
		
		
	}
	
   

}
