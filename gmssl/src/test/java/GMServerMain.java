import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import javax.net.ServerSocketFactory;
import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLServerSocket;

/**
 * Created by JasonFitch on 10/24/2018.
 */
public class GMServerMain {

    public static void main(String[] args) throws CertificateException, UnrecoverableKeyException, NoSuchAlgorithmException, KeyStoreException, KeyManagementException, NoSuchProviderException, IOException {
        ProviderUtil.deleteProvider();
        ProviderUtil.insertProvicer();

        //server keystore
        KeyStore ks = KeyStore.getInstance("PKCS12", "BC");
        ks.load(new FileInputStream(Contants.SERVER_KEY_STORE), Contants.SERVER_KEY_STORE_PASSWORD.toCharArray());

        KeyManagerFactory kf = KeyManagerFactory.getInstance("SunX509", "SunJSSE");
        kf.init(ks, Contants.SERVER_KEY_STORE_PASSWORD.toCharArray());

        SSLContext sslContext = SSLContext.getInstance("TLS", "SunJSSE");
        sslContext.init(kf.getKeyManagers(), null, null);

        ServerSocketFactory factory      = sslContext.getServerSocketFactory();
        ServerSocket        serverSocket = factory.createServerSocket(8443);
        ((SSLServerSocket) serverSocket).setNeedClientAuth(false);
//        ((SSLServerSocket) serverSocket).setNeedClientAuth(true);

        while (true) {
            System.out.println("##########waiting for client on port 8443 ...##########");
            Socket clientSocket = serverSocket.accept();

            BufferedReader reader = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
            PrintWriter    writer = new PrintWriter(clientSocket.getOutputStream());

            String data = reader.readLine();
            writer.println(data);
            writer.close();
            clientSocket.close();
        }
    }

}

