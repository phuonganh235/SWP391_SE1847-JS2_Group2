<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="model.News" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>HappyBeauty</title>

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>

        <!-- Header Section Begin -->
        <jsp:include page="navbar.jsp"/>
        <!-- Header Section End -->

        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="home"><i class="fa fa-home"></i> Home</a>
                            <span>News</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Blog Details Section Begin -->
        <section class="blog-details spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-8">
                        <div class="blog__details__content">
                            <div class="blog__details__item">
                                <img src="<c:url value='${news.imgUrl}' />" alt="News Image">
                                <div class="blog__details__item__title">
                                    <span class="tip">Làm đẹp</span>
                                    <h4><c:out value="${news.title}" /></h4>
                                    <ul>
                                        <li><fmt:formatDate value="${news.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></li>
                                        <!-- You can adjust or remove this as per your news model -->
                                    </ul>
                                </div>
                            </div>
                            <div class="blog__details__desc">
                                <p><c:out value="${news.content}" /></p>
                                <!-- Display other attributes as needed -->
                            </div>
<!--                            <div class="blog__details__tags">
                                <a href="#">Fashion</a>
                                <a href="#">Street style</a>
                                <a href="#">Diversity</a>
                                <a href="#">Beauty</a>
                            </div>-->
                            <div class="blog__details__btns">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="blog__details__btn__item">
                                            <h6><a href="#"><i class="fa fa-angle-left"></i> Previous posts</a></h6>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="blog__details__btn__item blog__details__btn__item--next">
                                            <h6><a href="#">Next posts <i class="fa fa-angle-right"></i></a></h6>
                                        </div>
                                    </div>
                                </div>
                            </div>   
<!--                            <div class="blog__details__comment">
                                <h5>3 Comment</h5>
                                <a href="#" class="leave-btn">Leave a comment</a>
                                <div class="blog__comment__item">
                                    <div class="blog__comment__item__pic">
                                        <img src="img/blog/details/comment-1.jpg" alt="">
                                    </div>
                                    <div class="blog__comment__item__text">
                                        <h6>Brandon Kelley</h6>
                                        <p>Duis voluptatum. Id vis consequat consetetur dissentiet, ceteros commune perpetua
                                            mei et. Simul viderer facilisis egimus tractatos splendi.</p>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Seb 17, 2019</li>
                                            <li><i class="fa fa-heart-o"></i> 12</li>
                                            <li><i class="fa fa-share"></i> 1</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="blog__comment__item blog__comment__item--reply">
                                    <div class="blog__comment__item__pic">
                                        <img src="img/blog/details/comment-2.jpg" alt="">
                                    </div>
                                    <div class="blog__comment__item__text">
                                        <h6>Brandon Kelley</h6>
                                        <p>Consequat consetetur dissentiet, ceteros commune perpetua mei et. Simul viderer
                                            facilisis egimus ulla mcorper.</p>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Seb 17, 2019</li>
                                            <li><i class="fa fa-heart-o"></i> 12</li>
                                            <li><i class="fa fa-share"></i> 1</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="blog__comment__item">
                                    <div class="blog__comment__item__pic">
                                        <img src="img/blog/details/comment-3.jpg" alt="">
                                    </div>
                                    <div class="blog__comment__item__text">
                                        <h6>Brandon Kelley</h6>
                                        <p>Duis voluptatum. Id vis consequat consetetur dissentiet, ceteros commune perpetua
                                            mei et. Simul viderer facilisis egimus tractatos splendi.</p>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Seb 17, 2019</li>
                                            <li><i class="fa fa-heart-o"></i> 12</li>
                                            <li><i class="fa fa-share"></i> 1</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>-->
                        </div>
                    </div>
<!--                    <div class="col-lg-4 col-md-4">
                        <div class="blog__sidebar">
                            <div class="blog__sidebar__item">
                                <div class="section-title">
                                    <h4>Categories</h4>
                                </div>
                                <ul>
                                    <li><a href="#">All <span>(250)</span></a></li>
                                    <li><a href="#">Fashion week <span>(80)</span></a></li>
                                    <li><a href="#">Street style <span>(75)</span></a></li>
                                    <li><a href="#">Lifestyle <span>(35)</span></a></li>
                                    <li><a href="#">Beauty <span>(60)</span></a></li>
                                </ul>
                            </div>
                            <div class="blog__sidebar__item">
                                <div class="section-title">
                                    <h4>Feature posts</h4>
                                </div>
                                <a href="#" class="blog__feature__item">
                                    <div class="blog__feature__item__pic">
                                        <img src="img/blog/sidebar/fp-1.jpg" alt="">
                                    </div>
                                    <div class="blog__feature__item__text">
                                        <h6>Amf Cannes Red Carpet Celebrities Kend...</h6>
                                        <span>Seb 17, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__feature__item">
                                    <div class="blog__feature__item__pic">
                                        <img src="img/blog/sidebar/fp-2.jpg" alt="">
                                    </div>
                                    <div class="blog__feature__item__text">
                                        <h6>Amf Cannes Red Carpet Celebrities Kend...</h6>
                                        <span>Seb 17, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__feature__item">
                                    <div class="blog__feature__item__pic">
                                        <img src="img/blog/sidebar/fp-3.jpg" alt="">
                                    </div>
                                    <div class="blog__feature__item__text">
                                        <h6>Amf Cannes Red Carpet Celebrities Kend...</h6>
                                        <span>Seb 17, 2019</span>
                                    </div>
                                </a>
                            </div>
                            <div class="blog__sidebar__item">
                                <div class="section-title">
                                    <h4>Tags cloud</h4>
                                </div>
                                <div class="blog__sidebar__tags">
                                    <a href="#">Fashion</a>
                                    <a href="#">Street style</a>
                                    <a href="#">Diversity</a>
                                    <a href="#">Beauty</a>
                                </div>
                            </div>-->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Blog Details Section End -->
        <!-- Instagram Begin -->
        <div class="instagram">
            <div class="container-fluid">
                <div class="row">
                    <!-- Instagram items -->
                </div>
            </div>
        </div>
        <!-- Instagram End -->

        <!-- Footer Section Begin -->
        <jsp:include page="footer.jsp"/>
        <!-- Footer Section End -->

        <!-- Search Begin -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch">+</div>
                <form class="search-model-form">
                    <input type="text" id="search-input" placeholder="Search here.....">
                </form>
            </div>
        </div>
        <!-- Search End -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
