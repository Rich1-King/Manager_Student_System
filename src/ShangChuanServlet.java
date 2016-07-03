import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

/**
 * Created by rich1 on 7/3/16.
 */
@WebServlet(name = "ShangChuanServlet")
public class ShangChuanServlet extends HttpServlet{
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        StringBuilder sb = new StringBuilder();
        byte[] by = new byte[1024];
        BufferedInputStream bInput = new BufferedInputStream(request
                .getInputStream());
        while(bInput.read(by) > 0)
        {
            sb.append(by.toString());
        }
        bInput.close();
        File file = new File("/home/1.txt");
        FileInputStream fileInput = new FileInputStream(file);
        fileInput.read(sb.toString().getBytes());
        fileInput.close();
    }

    protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{

    }
}
