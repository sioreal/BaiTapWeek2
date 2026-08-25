package murach.survey;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import murach.business.User;

import java.io.IOException;

@WebServlet("/survey")
public class SurveyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Mặc định ban đầu trả về trang index.html
        String url = "/index.html";

        // Lấy hành động gửi từ client
        String action = request.getParameter("action");
        if (action == null) {
            action = "join"; // Nếu gọi /survey trực tiếp thì về form
        }

        // Xử lý action
        if (action.equals("join")) {
            url = "/index.html";
        }
        else if (action.equals("add")) {
            // Lấy dữ liệu từ form submit
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String day = request.getParameter("dobDay");
            String month = request.getParameter("dobMonth");
            String year = request.getParameter("dobYear");
            String dob = day + "/" + month + "/" + year;
            String hearFrom = request.getParameter("hearFrom");

            // Xử lý Checkbox (nhận null nếu người dùng không chọn)
            String wantsUpdates = request.getParameter("wantsUpdates");
            if (wantsUpdates == null) {
                wantsUpdates = "NO";
            } else {
                wantsUpdates = "YES";
            }

            String contactMethod = request.getParameter("contactMethod");

            // Tạo đối tượng User với constructor tương ứng
            User user = new User(firstName, lastName, email, dob, hearFrom, wantsUpdates, contactMethod);

            // Lưu dữ liệu vào Request Scope để nhờ thanks.jsp đọc
            request.setAttribute("user", user);

            // Chuyển hướng sang trang cảm ơn
            url = "/thanks.jsp";
        }

        // Chuyển hướng tới View tương ứng
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}