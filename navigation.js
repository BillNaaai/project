document.addEventListener("DOMContentLoaded", function () {
    const navHTML = `
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-navbar">
        <div class="container">
            <a class="navbar-brand" href="index.html">E-Shop</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="products.html">Products</a></li>
                    <li class="nav-item"><a class="nav-link" href="categoriespage.html">Categories</a></li>
                    <li class="nav-item"><a class="nav-link" href="contactpage.html">Contact</a></li>
                </ul>
                <span id="userGreeting" style="display: none; color: white; font-weight: bold; margin-right: 15px;"></span>
                <form class="d-flex me-2" id="searchBarContainer">
                    <input class="form-control me-2" type="search" placeholder="Search products">
                    <button class="btn btn-outline-light" type="submit">Search</button>
                </form>
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="shoppingcartpage.html"><i class="bi-cart"></i> Cart (0)</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi-person"></i> Account
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                            <li id="loginOption"><a class="dropdown-item" href="loginpage.html">Login</a></li>
                            <li id="registerOption"><a class="dropdown-item" href="registerpage.html">Register</a></li>
                            <li id="logoutOption" style="display: none;"><a class="dropdown-item" href="#" id="logoutBtn">Logout</a></li>
                            <li><hr class="dropdown-divider" id="accountDivider"></li>
                            <li id="profileOption"><a class="dropdown-item" href="profile.html">My Profile</a></li>
                            <li id="ordersOption"><a class="dropdown-item" href="orders.html">My Orders</a></li>
                            <li id="dashboardOption"><a class="dropdown-item" href="sellerdashboard.html">Seller Dashboard</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    `;

    // Insert navbar HTML
    document.getElementById("navigation-container").innerHTML = navHTML;

    // Wait briefly for DOM insertion before binding
    setTimeout(() => {
        const userData = sessionStorage.getItem("user");
        let user = null;

        if (userData) {
            try {
                user = JSON.parse(userData);
            } catch (error) {
                console.error("Error parsing sessionStorage user data:", error);
                sessionStorage.removeItem("user");
            }
        }

        const loginOption = document.getElementById("loginOption");
        const registerOption = document.getElementById("registerOption");
        const logoutOption = document.getElementById("logoutOption");
        const userGreeting = document.getElementById("userGreeting");

        const profileOption = document.getElementById("profileOption");
        const ordersOption = document.getElementById("ordersOption");
        const dashboardOption = document.getElementById("dashboardOption");
        const accountDivider = document.getElementById("accountDivider");

        if (user) {
            if (loginOption) loginOption.style.display = "none";
            if (registerOption) registerOption.style.display = "none";
            if (logoutOption) logoutOption.style.display = "block";
            if (userGreeting) {
                userGreeting.style.display = "inline-block";
                userGreeting.textContent = `Hello, ${user.first_name}!`;
            }
            if (profileOption) profileOption.style.display = "block";
            if (ordersOption) ordersOption.style.display = "block";
            if (dashboardOption) dashboardOption.style.display = "block";
            if (accountDivider) accountDivider.style.display = "block";

            const logoutBtn = document.getElementById("logoutBtn");
            if (logoutBtn) {
                logoutBtn.addEventListener("click", function (e) {
                    e.preventDefault();
                    sessionStorage.removeItem("user");
                    alert("Successfully logged out!");
                    window.location.href = "index.html";
                });
            }

        } else {
            if (loginOption) loginOption.style.display = "block";
            if (registerOption) registerOption.style.display = "block";
            if (logoutOption) logoutOption.style.display = "none";
            if (userGreeting) userGreeting.style.display = "none";

            if (profileOption) profileOption.style.display = "none";
            if (ordersOption) ordersOption.style.display = "none";
            if (dashboardOption) dashboardOption.style.display = "none";
            if (accountDivider) accountDivider.style.display = "none";
        }

    }, 100);
});