document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("footer-container").innerHTML = `
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="main.html" class="text-white">Home</a></li>
                        <li><a href="productpage.html" class="text-white">Products</a></li>
                        <li><a href="categoriespage.html" class="text-white">Categories</a></li>
                        <li><a href="aboutuspage.html" class="text-white">About Us</a></li>
                        <li><a href="contactpage.html" class="text-white">Contact</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <h5>Customer Service</h5>
                    <ul class="list-unstyled">
                        <li><a href="faqpage.html" class="text-white">FAQs</a></li>
                        <li><a href="shippingpolicypage.html" class="text-white">Shipping Policy</a></li>
                        <li><a href="returnpolicypage.html" class="text-white">Return Policy</a></li>
                        <li><a href="privacypage.html" class="text-white">Privacy Policy</a></li>
                        <li><a href="termsandconditionspage.html" class="text-white">Terms and Conditions</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <h5>My Account</h5>
                    <ul class="list-unstyled">
                        <li id="signInFooter"><a href="loginpage.html" class="text-white">Sign In</a></li>
                        <li id="registerFooter"><a href="registerpage.html" class="text-white">Register</a></li>
                        <li><a href="shoppingcartpage.html" class="text-white">View Cart</a></li>
                        <li><a href="#" class="text-white">My Orders</a></li>
                        <li><a href="helppage.html" class="text-white">Help</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <h5>Contact Us</h5>
                    <address class="text-white">
                        <strong>E-Shop Inc.</strong><br>
                        40 Blaauwberg Road<br>
                        Cape Town, Western Cape, 7441<br>
                        <abbr title="Phone">P:</abbr> +27 21 551 5500
                    </address>
                </div>
            </div>
            <hr class="bg-white">
            <div class="text-center">
                <p>&copy; 2025 E-Shop. All rights reserved.</p>
            </div>
        </div>
    </footer>
    `;

    // ✅ Check if user is logged in
    const userData = sessionStorage.getItem("user");
    let user = null;

    if (userData) {
        try {
            user = JSON.parse(userData);
        } catch (error) {
            console.error("❌ Error parsing sessionStorage user data in footer:", error);
            sessionStorage.removeItem("user");
        }
    }

    const signInFooter = document.getElementById("signInFooter");
    const registerFooter = document.getElementById("registerFooter");

    if (user) {
        // ✅ Remove "Sign In" & "Register" when logged in
        signInFooter.style.display = "none";
        registerFooter.style.display = "none";
    }
});