
<div class="footer-top-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="footer-menu">
                    <h2><span>EDeC</span></h2>
                    <div class="footer-social">
                        <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                        <a href="#" target="_b`lank"><i class="fa fa-pinterest"></i></a>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="footer-menu">
                    <h2 class="footer-wid-title">User Navigation </h2>
                    <ul>
                        <li><a href="<c:url value="/ratings"/>">Ratings</a></li>

                        <sec:authorize access="hasRole('ROLE_USER')">
                            <li><a href="#">My account</a></li>
                        </sec:authorize>

                        <sec:authorize access="!hasRole('ROLE_USER')">
                            <li><a href="<c:url value="/sign"/>">Login/Register</a></li>
                        </sec:authorize>

                        <li><a href="<c:url value="/about"/>">About</a></li>
                        <li><a href="<c:url value="/statistics"/>">Statistics</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer-bottom-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="copyright">
                    <p>&copy; 2016 EDeC. </p>
                </div>
            </div>
        </div>
    </div>
</div>