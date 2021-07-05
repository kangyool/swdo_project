package com.swdo.test.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageContext;
import com.google.cloud.vision.v1.Product;
import com.google.cloud.vision.v1.ProductSearchClient;
import com.google.cloud.vision.v1.ProductSearchParams;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.ProductSearchResults.Result;
import com.google.protobuf.ByteString;
import com.swdo.test.api.ProductSearchAPI;
import com.swdo.test.service.ProductService;
import com.swdo.test.service.UserService;
import com.swdo.test.util.PageNavigator;
import com.swdo.test.vo.ProductVO;
import com.swdo.test.vo.UserVO;

@RequestMapping(value = "/product")
@Controller
public class ProductViewController {
	
	@Autowired
	private ProductService service;
	
	private static final int COUNT_PER_PAGE = 3;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductViewController.class);
	
	@RequestMapping(value = "/enrollForm", method = RequestMethod.GET)
	public String moveToEnrollForm() {
		return "product/enrollForm";
	}
	
	@RequestMapping(value = "/listForm", method = RequestMethod.GET)
	public String listForm(Model model) throws IOException {
		
		ArrayList<Product> result =  ProductSearchAPI.listProducts("snappy-guard-316800", "us-west1");
		
		model.addAttribute("productList", result);
		return "product/listForm";
	}
	
	@RequestMapping(value = "/productListForm", method = RequestMethod.GET)
	public String productlistForm(Model model, @RequestParam(name = "searchText", defaultValue = "")String searchText, 
			@RequestParam(name = "currentPage", defaultValue = "1") int currentPage) throws IOException {
		
		int totalRecordsCount = service.productTotalRecordsCount(searchText);
		
		PageNavigator navi = new PageNavigator(currentPage, totalRecordsCount, COUNT_PER_PAGE);
		
		navi.setCurrentPage(navi.getCurrentPage() + 1); 
		
		ArrayList<ProductVO> result = service.productSelectAll(searchText, navi.getStartRecord(), COUNT_PER_PAGE);
		
		model.addAttribute("productList", result);
		model.addAttribute("searchText", searchText);
		model.addAttribute("navi", navi);
		
		return "product/productListForm";
	}
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(String productId) throws IOException {
		
		ProductSearchAPI.deleteProduct("snappy-guard-316800", "us-west1", productId);
		service.productDelete(productId);
		
		return "redirect:/product/listForm";
	}
	
	@RequestMapping(value = "/userImageUpload", method = RequestMethod.POST)
	public String userImageUpload(MultipartFile upload, RedirectAttributes redirect) throws IOException {
		
		logger.info("upload : {}", upload);
		
		String userImage = service.imageInsert(upload);
		
		logger.info("savedFilePath : {}", userImage);
		
		ArrayList<String> similarProduct = new ArrayList<String>();
		
		similarProduct = ProductSearchAPI.getSimilarProductsFile("snappy-guard-316800", "us-west1", "productSetId-001", "apparel-v2", userImage, "");
		
		System.out.println(similarProduct);
		
		//imageSearch 메소드로 redirect함과 동시에 데이터도 전달한다.
		redirect.addFlashAttribute("similarProduct", similarProduct);
		
		return "redirect:/product/imageSearch";
		
	}

	@RequestMapping(value = "/imageSearch", method = RequestMethod.GET)
	public String imageSearch(Model model, HttpServletRequest request, 
			@RequestParam(name = "currentPage", defaultValue = "1") int currentPage) {
		
		ArrayList<String> similarProduct = new ArrayList<String>();
		
		//ImageSearch로부터 전달된 데이터를 받는다.
        Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
        
        if(flashMap!=null) {
            
           similarProduct =(ArrayList<String>)flashMap.get("similarProduct");
        }
		
		logger.info("ArrayList<String> similarProduct : {}", similarProduct);
		
		int totalRecordsCount = service.productTotalRecordsCount_imageSearch(similarProduct);
		
		PageNavigator navi = new PageNavigator(currentPage, totalRecordsCount, COUNT_PER_PAGE);
		
		navi.setCurrentPage(navi.getCurrentPage() + 1); 
		
		ArrayList<ProductVO> result = service.productSelectAll_imageSearch(similarProduct, navi.getStartRecord(), COUNT_PER_PAGE);
		
		model.addAttribute("productList", result);
		model.addAttribute("navi", navi);
		
		return "product/productListForm_imageSearch";
	}
	
	
	@RequestMapping(value = "/productDetail", method = RequestMethod.GET)
	public String productDetail(Model model, String productId) throws IOException {
		
		ProductVO detail = service.productSelectOne(productId);
		String path = "C:/Users/kangyool/Desktop/SWDO/SWDO ICT PROJECT/project_swdo_reference/";
		
		String[] fileName_raw = detail.getUri().split("/");
		String fileName = fileName_raw[fileName_raw.length - 1];
		
		logger.info("productSelectOne : {}", detail);
		
		ArrayList<String> similarProduct = ProductSearchAPI.getSimilarProductsFile("snappy-guard-316800", "us-west1", "productSetId-001", "apparel-v2", path + fileName, "");
		ArrayList<ProductVO> related = service.productSelectAll_imageSearch(similarProduct);
		
		logger.info("------------------------------------------------");
		logger.info("related : {}", related);
		
		model.addAttribute("detail", detail);
		model.addAttribute("related", related);
		
		return "product/productDetail";
	}

	@RequestMapping(value= "/likeProduct", method = RequestMethod.GET)
	public String likeProductListForm(Model model) {
		
		ArrayList<String> result1 = service.likeProductSelect();
		
		logger.info("result1 : {}", result1 );
		
		ArrayList<ProductVO> result2 = service.productSelectAll_imageSearch(result1);
		
		model.addAttribute("productList", result2);
		
		logger.info("result2 : {}", result2 );
		
		return "product/likeProductListForm";
	}
	
}
