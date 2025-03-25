document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("navigation-container").innerHTML = `
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="main.html">E-Shop</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="products.html">Products</a></li>
                        <li class="nav-item"><a class="nav-link" href="categoriespage.html">Categories</a></li>
                        <li class="nav-item"><a class="nav-link" href="contactpage.html">Contact</a></li>
                    </ul>
                    <form class="d-flex me-2" id="searchBarContainer">
                        <input class="form-control me-2" type="search" placeholder="Search products">
                        <button class="btn btn-outline-light" type="submit">Search</button>
                    </form>
                    <span id="userGreeting" style="display: none; color: white; font-weight: bold; margin-right: 15px;"></span>
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="shoppingcartpage.html"><i class="bi-cart"></i> Cart (0)</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
                                <i class="bi-person"></i> Account
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                                <li id="loginOption"><a class="dropdown-item" href="loginpage.html">Login</a></li>
                                <li id="registerOption"><a class="dropdown-item" href="registerpage.html">Register</a></li>
                                <li id="logoutOption" style="display: none;"><a class="dropdown-item" href="#" id="logoutBtn">Logout</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="profile.html">My Profile</a></li>
                                <li><a class="dropdown-item" href="orders.html">My Orders</a></li>
                                <li><a class="dropdown-item" href="seller-dashboard.html">Seller Dashboard</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    `;

    // ✅ Fix: Only parse JSON if session exists
    const userData = sessionStorage.getItem("user");
    let user = null;

    if (userData) {
        try {
            user = JSON.parse(userData);
        } catch (error) {
            console.error("Error parsing sessionStorage user data:", error);
            sessionStorage.removeItem("user"); // Reset session if corrupted
        }
    }

    const loginOption = document.getElementById("loginOption");
    const registerOption = document.getElementById("registerOption");
    const logoutOption = document.getElementById("logoutOption");
    const userGreeting = document.getElementById("userGreeting");

    if (user) {
        // ✅ Hide Login & Register options
        loginOption.style.display = "none";
        registerOption.style.display = "none";

        // ✅ Show Logout in dropdown
        logoutOption.style.display = "block";

        // ✅ Show "Hello, [User Name]" in white & aligned correctly
        userGreeting.style.display = "inline-block";
        userGreeting.textContent = `Hello, ${user.first_name}!`;

        // ✅ Logout functionality with alert
        document.getElementById("logoutBtn").addEventListener("click", function () {
            sessionStorage.removeItem("user"); // Remove session
            alert("Successfully logged out!"); // ✅ Show logout popup
            window.location.href = "main.html"; // ✅ Redirect after logout
        });
    }
});