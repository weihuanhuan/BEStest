package ipv6;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Socket;

/**
 * Created by JasonFitch on 8/16/2018.
 */
public class ClinetHttp
{
    public static void main(String[] args)
    {

        try
        {
            Socket sc = new Socket("[fe80:0:0:0:20c:29ff:fe68:65ec%7]", 8080);
//            对于LocalLink地址的请求，必须加接口锁引
//            否则出现以下异常
//            java.net.UnknownHostException: fe80:0:0:0:20c:29ff:fe68:65ec]
//            Server 和 Clinet 的 区别
            //同时服务器端可以不指定接口索引，应该是jdk自动判断了？但是客户端必须显示的指定接口索引

//            后来又发现客户端有时也不需要指定索引号，那么到底什么情况下需要指定？
//            注意当不指定接口索引且没有IPv6邻居表时第一次请求一定会失败，Chrome错误代码是：
//                This page isn’t working
//                [fe80::20c:29ff:fe68:65ec] is currently unable to handle this request.
//                HTTP ERROR 503
//            而这个错误之后在请求就可以了，但是重新删除路由邻居后再次请求第一次任然报这个错。
//            同时当显式的指定接口索引时，不论清不清空邻居表都会一次请求成功，所以这个现象和ip链路有关系？



//            Socket sc = new Socket("[fe80::18c9:8e29:8d2c:acd3%7]", 65010);

//            Socket sc = new Socket("[2001:db8:0:f101:0:0:0:1]", 8090);


            sc.getOutputStream().write("Get /BEStest-1.0-SNAPSHOT/request HTTP/1.1\r\n".getBytes());
            sc.getOutputStream().write("Host:192.168.88.1\r\n".getBytes());
            sc.getOutputStream().write("\r\n".getBytes());

            InputStream is = sc.getInputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            String line;
            while (null != (line = br.readLine()))
            {
                System.out.println(line);
            }


        } catch (IOException e)
        {
            e.printStackTrace();
        }
    }
}
