<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Cảm ơn bạn - Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
    <div class="container">
        <header>
            <img src="images/murachlogo.png" alt="Murach Logo" class="logo">
        </header>

        <h1>Thanks for joining our list!</h1>
        <p>Here is the information that you entered:</p>

        <div class="result-box">
            <div class="result-item">
                <span class="label">First Name:</span>
                <span class="value">${user.firstName}</span>
            </div>

            <div class="result-item">
                <span class="label">Last Name:</span>
                <span class="value">${user.lastName}</span>
            </div>

            <div class="result-item">
                <span class="label">Email:</span>
                <span class="value">${user.email}</span>
            </div>

            <div class="result-item">
                <span class="label">Date of Birth:</span>
                <span class="value">${user.dob}</span>
            </div>

            <div class="result-item">
                <span class="label">Heard From Us:</span>
                <span class="value">${user.hearFrom}</span>
            </div>

            <div class="result-item">
                <span class="label">Receive Updates:</span>
                <span class="value">${user.wantsUpdates}</span>
            </div>

            <div class="result-item">
                <span class="label">Contact Method:</span>
                <span class="value">${user.contactMethod}</span>
            </div>
        </div>

        <form action="index.html" method="get">
            <button type="submit" class="btn-submit">Return to Survey</button>
        </form>
    </div>
</body>
</html>