package study.spring.selection.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.selection.helper.PageData;
import study.spring.selection.model.Product;
import study.spring.selection.model.User;
import study.spring.selection.service.ProductService;

@Controller
public class ProductController {

    @Autowired
    ProductService service;

    /** Acc 상품목록 */
    @RequestMapping(value = "/Acc.do", method = RequestMethod.GET)
    public ModelAndView AccProductList(ModelAndView mav,
            @RequestParam(value="page", defaultValue="1") int nowPage,
            @RequestParam(value="highPrice", defaultValue="0") int highPrice,
            @RequestParam(value="lowPrice", defaultValue="0") int lowPrice,
            @RequestParam(value="search", required=false) String search) {

        int totalCount = 0;        // 전체 게시글 수
        int listCount  = 8;        // 한 페이지당 표시할 목록 수
        int pageCount  = 5;        // 한 그룹당 표시할 페이지 번호 수

        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Product input = new Product();
        input.setProduct_category("Acc");
        input.setProduct_name(search);

        List<Product> output = null; // 조회결과가 저장될 객체
        List<Product> output2 = null; // 조회결과가 저장될 객체
        List<Product> output3 = null; // 조회결과가 저장될 객체
        PageData pageData = null;       // 페이지 번호를 계산한 결과가 저장될 객체

        try {
            // 전체 게시글 수 조회
            totalCount = service.getProductCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Product.setOffset(pageData.getOffset());
            Product.setListCount(pageData.getListCount());

            // 데이터 조회하기
            output = service.getProductList(input);
            output2 = service.getProductLowPriceList(input);
            output3 = service.getProductHighPriceList(input);
        } catch (Exception e) { e.printStackTrace(); }


        if (highPrice == 1) {
            mav.addObject("output3", output3);
        } else if (lowPrice == 1) {
            mav.addObject("output2", output2);
        } else {
            mav.addObject("output", output);
        }
        mav.setViewName("Acc");
        mav.addObject("search", search);
        mav.addObject("lowPrice", lowPrice);
        mav.addObject("highPrice", highPrice);
        mav.addObject("pageData", pageData);
        return mav;
    }

    /** Acc 상품상세 */
    @RequestMapping(value = "/AccDetail.do/{product_no}", method = RequestMethod.GET)
    public ModelAndView AccProductDetail(@PathVariable("product_no") int product_no, ModelAndView mav, HttpSession session) {
        mav.setViewName("Detail");
        mav.addObject("product", service.productDetail(product_no));

        //맵생성 왜냐면 product_no와 user_no 2개를 보내기위해
        Map<String, Object> map = new HashMap<>();

        // 세션을 넣는 이유 사용자 정보 가져오기 (user_no) 위해서
        User user = (User) session.getAttribute("user");

        //로그인
        if(user == null) {
            map.put("myheart_no", 0);
            mav.addObject("myheart_no", map);
            return mav;

        } else {
            int user_no = user.getUser_no();

            map.put("user_no", user_no);
            map.put("product_no", product_no);
            mav.addObject("heart", service.myHeartList(map));
            return mav;
        }
    }

    /** Best 상품목록 */
    @RequestMapping(value = "/Best.do", method = RequestMethod.GET)
    public ModelAndView BestProductList(ModelAndView mav,
            @RequestParam(value="page", defaultValue="1") int nowPage,
            @RequestParam(value="highPrice", defaultValue="0") int highPrice,
            @RequestParam(value="lowPrice", defaultValue="0") int lowPrice,
            @RequestParam(value="search", required=false) String search){

        int totalCount = 0;        // 전체 게시글 수
        int listCount  = 8;        // 한 페이지당 표시할 목록 수
        int pageCount  = 5;        // 한 그룹당 표시할 페이지 번호 수

        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Product input = new Product();
        input.setProduct_category("Best");
        input.setProduct_name(search);

        List<Product> output = null; // 조회결과가 저장될 객체
        List<Product> output2 = null; // 조회결과가 저장될 객체
        List<Product> output3 = null; // 조회결과가 저장될 객체
        PageData pageData = null;       // 페이지 번호를 계산한 결과가 저장될 객체

        try {
            // 전체 게시글 수 조회
            totalCount = service.getProductCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Product.setOffset(pageData.getOffset());
            Product.setListCount(pageData.getListCount());

            // 데이터 조회하기
            output = service.getProductList(input);
            output2 = service.getProductLowPriceList(input);
            output3 = service.getProductHighPriceList(input);
        } catch (Exception e) { e.printStackTrace(); }

        if (highPrice == 1) {
            mav.addObject("output3", output3);
        } else if (lowPrice == 1) {
            mav.addObject("output2", output2);
        } else {
            mav.addObject("output", output);
        }
        mav.setViewName("Best");
        mav.addObject("search", search);
        mav.addObject("lowPrice", lowPrice);
        mav.addObject("highPrice", highPrice);
        mav.addObject("pageData", pageData);
        return mav;
    }

    /** Best 상품상세 */
    @RequestMapping(value = "/BestDetail.do/{product_no}", method = RequestMethod.GET)
    public ModelAndView BestProductDetail(@PathVariable("product_no") int product_no, ModelAndView mav, HttpSession session) {
        mav.setViewName("Detail");
        mav.addObject("product", service.productDetail(product_no));

        //맵생성 왜냐면 product_no와 user_no 2개를 보내기위해
        Map<String, Object> map = new HashMap<>();

        // 세션을 넣는 이유 사용자 정보 가져오기 (user_no) 위해서
        User user = (User) session.getAttribute("user");

        //로그인
        if(user == null) {
            map.put("myheart_no", 0);
            mav.addObject("myheart_no", map);
            return mav;

        } else {
            int user_no = user.getUser_no();

            map.put("user_no", user_no);
            map.put("product_no", product_no);
            mav.addObject("heart", service.myHeartList(map));
            return mav;
        }
    }

    /** Dress 상품목록 */
    @RequestMapping(value = "/Dress.do", method = RequestMethod.GET)
    public ModelAndView DressProductList(ModelAndView mav,
            @RequestParam(value="page", defaultValue="1") int nowPage,
            @RequestParam(value="highPrice", defaultValue="0") int highPrice,
            @RequestParam(value="lowPrice", defaultValue="0") int lowPrice,
            @RequestParam(value="search", required=false) String search) {

        int totalCount = 0;        // 전체 게시글 수
        int listCount  = 8;        // 한 페이지당 표시할 목록 수
        int pageCount  = 5;        // 한 그룹당 표시할 페이지 번호 수

        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Product input = new Product();
        input.setProduct_category("Dress");
        input.setProduct_name(search);

        List<Product> output = null; // 조회결과가 저장될 객체
        List<Product> output2 = null; // 조회결과가 저장될 객체
        List<Product> output3 = null; // 조회결과가 저장될 객체
        PageData pageData = null;       // 페이지 번호를 계산한 결과가 저장될 객체

        try {
            // 전체 게시글 수 조회
            totalCount = service.getProductCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Product.setOffset(pageData.getOffset());
            Product.setListCount(pageData.getListCount());

            // 데이터 조회하기
            output = service.getProductList(input);
            output2 = service.getProductLowPriceList(input);
            output3 = service.getProductHighPriceList(input);
        } catch (Exception e) { e.printStackTrace(); }

        if (highPrice == 1) {
            mav.addObject("output3", output3);
        } else if (lowPrice == 1) {
            mav.addObject("output2", output2);
        } else {
            mav.addObject("output", output);
        }
        mav.setViewName("Dress");
        mav.addObject("search", search);
        mav.addObject("lowPrice", lowPrice);
        mav.addObject("highPrice", highPrice);
        mav.addObject("pageData", pageData);
        return mav;
    }

    /** Dress 상품상세 */
    @RequestMapping(value = "/DressDetail.do/{product_no}", method = RequestMethod.GET)
    public ModelAndView DressProductDetail(@PathVariable("product_no") int product_no, ModelAndView mav, HttpSession session) {
        mav.setViewName("Detail");
        mav.addObject("product", service.productDetail(product_no));

        //맵생성 왜냐면 product_no와 user_no 2개를 보내기위해
        Map<String, Object> map = new HashMap<>();

        // 세션을 넣는 이유 사용자 정보 가져오기 (user_no) 위해서
        User user = (User) session.getAttribute("user");

        //로그인
        if(user == null) {
            map.put("myheart_no", 0);
            mav.addObject("myheart_no", map);
            return mav;

        } else {
            int user_no = user.getUser_no();

            map.put("user_no", user_no);
            map.put("product_no", product_no);
            mav.addObject("heart", service.myHeartList(map));
            return mav;
        }
    }

    /** New 상품목록 */
    @RequestMapping(value = "/New.do", method = RequestMethod.GET)
    public ModelAndView NewProductList(ModelAndView mav,
            @RequestParam(value="page", defaultValue="1") int nowPage,
            @RequestParam(value="highPrice", defaultValue="0") int highPrice,
            @RequestParam(value="lowPrice", defaultValue="0") int lowPrice,
            @RequestParam(value="search", required=false) String search) {

        int totalCount = 0;        // 전체 게시글 수
        int listCount  = 8;        // 한 페이지당 표시할 목록 수
        int pageCount  = 5;        // 한 그룹당 표시할 페이지 번호 수

        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Product input = new Product();
        input.setProduct_category("New");
        input.setProduct_name(search);

        List<Product> output = null; // 조회결과가 저장될 객체
        List<Product> output2 = null; // 조회결과가 저장될 객체
        List<Product> output3 = null; // 조회결과가 저장될 객체
        PageData pageData = null;       // 페이지 번호를 계산한 결과가 저장될 객체

        try {
            // 전체 게시글 수 조회
            totalCount = service.getProductCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Product.setOffset(pageData.getOffset());
            Product.setListCount(pageData.getListCount());

            // 데이터 조회하기
            output = service.getProductList(input);
            output2 = service.getProductLowPriceList(input);
            output3 = service.getProductHighPriceList(input);
        } catch (Exception e) { e.printStackTrace(); }

        if (highPrice == 1) {
            mav.addObject("output3", output3);
        } else if (lowPrice == 1) {
            mav.addObject("output2", output2);
        } else {
            mav.addObject("output", output);
        }
        mav.setViewName("New");
        mav.addObject("search", search);
        mav.addObject("lowPrice", lowPrice);
        mav.addObject("highPrice", highPrice);
        mav.addObject("pageData", pageData);
        return mav;
    }

    /** New 상품상세 */
    @RequestMapping(value = "/NewDetail.do/{product_no}", method = RequestMethod.GET)
    public ModelAndView NewProductDetail(@PathVariable("product_no") int product_no, ModelAndView mav, HttpSession session) {
        mav.setViewName("Detail");
        mav.addObject("product", service.productDetail(product_no));

        //맵생성 왜냐면 product_no와 user_no 2개를 보내기위해
        Map<String, Object> map = new HashMap<>();

        // 세션을 넣는 이유 사용자 정보 가져오기 (user_no) 위해서
        User user = (User) session.getAttribute("user");

        //로그인
        if(user == null) {
            map.put("myheart_no", 0);
            mav.addObject("myheart_no", map);
            return mav;

        } else {
            int user_no = user.getUser_no();

            map.put("user_no", user_no);
            map.put("product_no", product_no);
            mav.addObject("heart", service.myHeartList(map));
            return mav;
        }
    }

    /** Outer 상품목록 */
    @RequestMapping(value = "/Outer.do", method = RequestMethod.GET)
    public ModelAndView OuterProductList(ModelAndView mav,
            @RequestParam(value="page", defaultValue="1") int nowPage,
            @RequestParam(value="highPrice", defaultValue="0") int highPrice,
            @RequestParam(value="lowPrice", defaultValue="0") int lowPrice,
            @RequestParam(value="search", required=false) String search) {

        int totalCount = 0;        // 전체 게시글 수
        int listCount  = 8;        // 한 페이지당 표시할 목록 수
        int pageCount  = 5;        // 한 그룹당 표시할 페이지 번호 수

        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Product input = new Product();
        input.setProduct_category("Outer");
        input.setProduct_name(search);

        List<Product> output = null; // 조회결과가 저장될 객체
        List<Product> output2 = null; // 조회결과가 저장될 객체
        List<Product> output3 = null; // 조회결과가 저장될 객체
        PageData pageData = null;       // 페이지 번호를 계산한 결과가 저장될 객체

        try {
            // 전체 게시글 수 조회
            totalCount = service.getProductCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Product.setOffset(pageData.getOffset());
            Product.setListCount(pageData.getListCount());

            // 데이터 조회하기
            output = service.getProductList(input);
            output2 = service.getProductLowPriceList(input);
            output3 = service.getProductHighPriceList(input);
        } catch (Exception e) { e.printStackTrace(); }

        if (highPrice == 1) {
            mav.addObject("output3", output3);
        } else if (lowPrice == 1) {
            mav.addObject("output2", output2);
        } else {
            mav.addObject("output", output);
        }
        mav.setViewName("Outer");
        mav.addObject("search", search);
        mav.addObject("lowPrice", lowPrice);
        mav.addObject("highPrice", highPrice);
        mav.addObject("pageData", pageData);
        return mav;
    }

    /** Outer 상품상세 */
    @RequestMapping(value = "/OuterDetail.do/{product_no}", method = RequestMethod.GET)
    public ModelAndView OuterProductDetail(@PathVariable("product_no") int product_no, ModelAndView mav, HttpSession session) {
        mav.setViewName("Detail");
        mav.addObject("product", service.productDetail(product_no));

        //맵생성 왜냐면 product_no와 user_no 2개를 보내기위해
        Map<String, Object> map = new HashMap<>();

        // 세션을 넣는 이유 사용자 정보 가져오기 (user_no) 위해서
        User user = (User) session.getAttribute("user");

        //로그인
        if(user == null) {
            map.put("myheart_no", 0);
            mav.addObject("myheart_no", map);
            return mav;

        } else {
            int user_no = user.getUser_no();

            map.put("user_no", user_no);
            map.put("product_no", product_no);
            mav.addObject("heart", service.myHeartList(map));
            return mav;
        }
    }

    /** Pants 상품목록 */
    @RequestMapping(value = "/Pants.do", method = RequestMethod.GET)
    public ModelAndView PantsProductList(ModelAndView mav,
            @RequestParam(value="page", defaultValue="1") int nowPage,
            @RequestParam(value="highPrice", defaultValue="0") int highPrice,
            @RequestParam(value="lowPrice", defaultValue="0") int lowPrice,
            @RequestParam(value="search", required=false) String search) {

        int totalCount = 0;        // 전체 게시글 수
        int listCount  = 8;        // 한 페이지당 표시할 목록 수
        int pageCount  = 5;        // 한 그룹당 표시할 페이지 번호 수

        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Product input = new Product();
        input.setProduct_category("Pants");
        input.setProduct_name(search);

        List<Product> output = null; // 조회결과가 저장될 객체
        List<Product> output2 = null; // 조회결과가 저장될 객체
        List<Product> output3 = null; // 조회결과가 저장될 객체
        PageData pageData = null;       // 페이지 번호를 계산한 결과가 저장될 객체

        try {
            // 전체 게시글 수 조회
            totalCount = service.getProductCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Product.setOffset(pageData.getOffset());
            Product.setListCount(pageData.getListCount());

            // 데이터 조회하기
            output = service.getProductList(input);
            output2 = service.getProductLowPriceList(input);
            output3 = service.getProductHighPriceList(input);
        } catch (Exception e) { e.printStackTrace(); }

        if (highPrice == 1) {
            mav.addObject("output3", output3);
        } else if (lowPrice == 1) {
            mav.addObject("output2", output2);
        } else {
            mav.addObject("output", output);
        }
        mav.setViewName("Pants");
        mav.addObject("search", search);
        mav.addObject("lowPrice", lowPrice);
        mav.addObject("highPrice", highPrice);
        mav.addObject("pageData", pageData);
        return mav;
    }

    /** Pants 상품상세 */
    @RequestMapping(value = "/PantsDetail.do/{product_no}", method = RequestMethod.GET)
    public ModelAndView PantsProductDetail(@PathVariable("product_no") int product_no, ModelAndView mav, HttpSession session) {
        mav.setViewName("Detail");
        mav.addObject("product", service.productDetail(product_no));

        //맵생성 왜냐면 product_no와 user_no 2개를 보내기위해
        Map<String, Object> map = new HashMap<>();

        // 세션을 넣는 이유 사용자 정보 가져오기 (user_no) 위해서
        User user = (User) session.getAttribute("user");

        //로그인
        if(user == null) {
            map.put("myheart_no", 0);
            mav.addObject("myheart_no", map);
            return mav;

        } else {
            int user_no = user.getUser_no();

            map.put("user_no", user_no);
            map.put("product_no", product_no);
            mav.addObject("heart", service.myHeartList(map));
            return mav;
        }
    }

    /** Recommend 상품목록 */
    @RequestMapping(value = "/Recommend.do", method = RequestMethod.GET)
    public ModelAndView RecommendProductList(ModelAndView mav,
            @RequestParam(value="page", defaultValue="1") int nowPage,
            @RequestParam(value="highPrice", defaultValue="0") int highPrice,
            @RequestParam(value="lowPrice", defaultValue="0") int lowPrice,
            @RequestParam(value="search", required=false) String search) {

        int totalCount = 0;        // 전체 게시글 수
        int listCount  = 8;        // 한 페이지당 표시할 목록 수
        int pageCount  = 5;        // 한 그룹당 표시할 페이지 번호 수

        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Product input = new Product();
        input.setProduct_category("Recommend");
        input.setProduct_name(search);

        List<Product> output = null; // 조회결과가 저장될 객체
        List<Product> output2 = null; // 조회결과가 저장될 객체
        List<Product> output3 = null; // 조회결과가 저장될 객체
        PageData pageData = null;       // 페이지 번호를 계산한 결과가 저장될 객체

        try {
            // 전체 게시글 수 조회
            totalCount = service.getProductCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Product.setOffset(pageData.getOffset());
            Product.setListCount(pageData.getListCount());

            // 데이터 조회하기
            output = service.getProductList(input);
            output2 = service.getProductLowPriceList(input);
            output3 = service.getProductHighPriceList(input);
        } catch (Exception e) { e.printStackTrace(); }

        if (highPrice == 1) {
            mav.addObject("output3", output3);
        } else if (lowPrice == 1) {
            mav.addObject("output2", output2);
        } else {
            mav.addObject("output", output);
        }
        mav.setViewName("Recommend");
        mav.addObject("search", search);
        mav.addObject("lowPrice", lowPrice);
        mav.addObject("highPrice", highPrice);
        mav.addObject("pageData", pageData);
        return mav;
    }

    /** Recommend 상품상세 */
    @RequestMapping(value = "/RecommendDetail.do/{product_no}", method = RequestMethod.GET)
    public ModelAndView RecommendProductDetail(@PathVariable("product_no") int product_no, ModelAndView mav, HttpSession session) {
        mav.setViewName("Detail");
        mav.addObject("product", service.productDetail(product_no));

        //맵생성 왜냐면 product_no와 user_no 2개를 보내기위해
        Map<String, Object> map = new HashMap<>();

        // 세션을 넣는 이유 사용자 정보 가져오기 (user_no) 위해서
        User user = (User) session.getAttribute("user");

        //로그인
        if(user == null) {
            map.put("myheart_no", 0);
            mav.addObject("myheart_no", map);
            return mav;

        } else {
            int user_no = user.getUser_no();

            map.put("user_no", user_no);
            map.put("product_no", product_no);
            mav.addObject("heart", service.myHeartList(map));
            return mav;
        }
    }

    /** Top 상품목록 */
    @RequestMapping(value = "/Top.do", method = RequestMethod.GET)
    public ModelAndView TopProductList(ModelAndView mav,
            @RequestParam(value="page", defaultValue="1") int nowPage,
            @RequestParam(value="highPrice", defaultValue="0") int highPrice,
            @RequestParam(value="lowPrice", defaultValue="0") int lowPrice,
            @RequestParam(value="search", required=false) String search) {

        int totalCount = 0;        // 전체 게시글 수
        int listCount  = 8;        // 한 페이지당 표시할 목록 수
        int pageCount  = 5;        // 한 그룹당 표시할 페이지 번호 수

        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Product input = new Product();
        input.setProduct_category("Top");
        input.setProduct_name(search);

        List<Product> output = null; // 조회결과가 저장될 객체
        List<Product> output2 = null; // 조회결과가 저장될 객체
        List<Product> output3 = null; // 조회결과가 저장될 객체
        PageData pageData = null;       // 페이지 번호를 계산한 결과가 저장될 객체

        try {
            // 전체 게시글 수 조회
            totalCount = service.getProductCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Product.setOffset(pageData.getOffset());
            Product.setListCount(pageData.getListCount());

            // 데이터 조회하기
            output = service.getProductList(input);
            output2 = service.getProductLowPriceList(input);
            output3 = service.getProductHighPriceList(input);
        } catch (Exception e) { e.printStackTrace(); }

        if (highPrice == 1) {
            mav.addObject("output3", output3);
        } else if (lowPrice == 1) {
            mav.addObject("output2", output2);
        } else {
            mav.addObject("output", output);
        }
        mav.setViewName("Top");
        mav.addObject("search", search);
        mav.addObject("lowPrice", lowPrice);
        mav.addObject("highPrice", highPrice);
        mav.addObject("pageData", pageData);
        return mav;
    }

    /** Top 상품상세 */
    @RequestMapping(value = "/TopDetail.do/{product_no}", method = RequestMethod.GET)
    public ModelAndView TopProductDetail(@PathVariable("product_no") int product_no, ModelAndView mav, HttpSession session) {
        mav.setViewName("Detail");
        mav.addObject("product", service.productDetail(product_no));

        //맵생성 왜냐면 product_no와 user_no 2개를 보내기위해
        Map<String, Object> map = new HashMap<>();

        // 세션을 넣는 이유 사용자 정보 가져오기 (user_no) 위해서
        User user = (User) session.getAttribute("user");

        //로그인
        if(user == null) {
            map.put("myheart_no", 0);
            mav.addObject("myheart_no", map);
            return mav;

        } else {
            int user_no = user.getUser_no();

            map.put("user_no", user_no);
            map.put("product_no", product_no);
            mav.addObject("heart", service.myHeartList(map));
            return mav;
        }
    }

    /** 상품상세 */
    @RequestMapping(value = "/Detail.do/{product_no}", method = RequestMethod.GET)
    public ModelAndView ProductDetail(@PathVariable("product_no") int product_no, ModelAndView mav, HttpSession session) {
        mav.setViewName("Detail");
        mav.addObject("product", service.productDetail(product_no));

        //맵생성 왜냐면 product_no와 user_no 2개를 보내기위해
        Map<String, Object> map = new HashMap<>();

        // 세션을 넣는 이유 사용자 정보 가져오기 (user_no) 위해서
        User user = (User) session.getAttribute("user");

        //로그인
        if(user == null) {
            map.put("myheart_no", 0);
            mav.addObject("myheart_no", map);
            return mav;

        } else {
            int user_no = user.getUser_no();

            map.put("user_no", user_no);
            map.put("product_no", product_no);
            mav.addObject("heart", service.myHeartList(map));
            return mav;
        }
    }
    
    /** ProductAll 상품목록 */
    @RequestMapping(value = "/ProductAll.do", method = RequestMethod.GET)
    public ModelAndView ProductAllList(ModelAndView mav,
            @RequestParam(value="page", defaultValue="1") int nowPage,
            @RequestParam(value="highPrice", defaultValue="0") int highPrice,
            @RequestParam(value="lowPrice", defaultValue="0") int lowPrice,
            @RequestParam(value="search", required=false) String search) {

        int totalCount = 0;        // 전체 게시글 수
        int listCount  = 8;        // 한 페이지당 표시할 목록 수
        int pageCount  = 5;        // 한 그룹당 표시할 페이지 번호 수

        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Product input = new Product();
        input.setProduct_name(search);

        List<Product> output = null; // 조회결과가 저장될 객체
        List<Product> output2 = null; // 조회결과가 저장될 객체
        List<Product> output3 = null; // 조회결과가 저장될 객체
        PageData pageData = null;       // 페이지 번호를 계산한 결과가 저장될 객체

        try {
            // 전체 게시글 수 조회
            totalCount = service.getProductAllCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Product.setOffset(pageData.getOffset());
            Product.setListCount(pageData.getListCount());

            // 데이터 조회하기
            output = service.getProductAllList(input);
            output2 = service.getProductAllLowPriceList(input);
            output3 = service.getProductAllHighPriceList(input);
        } catch (Exception e) { e.printStackTrace(); }

        if (highPrice == 1) {
            mav.addObject("output3", output3);
        } else if (lowPrice == 1) {
            mav.addObject("output2", output2);
        } else {
            mav.addObject("output", output);
        }
        mav.setViewName("ProductAll");
        mav.addObject("search", search);
        mav.addObject("lowPrice", lowPrice);
        mav.addObject("highPrice", highPrice);
        mav.addObject("pageData", pageData);
        return mav;
    }
}
