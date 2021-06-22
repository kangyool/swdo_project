package com.swdo.test.apiGroundWork;

import java.io.IOException;

public class API_run {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		
	    String projectId = ""; //프로젝트마다 상이
	    String computeRegion = "us-west1";
	  
	    String location = "us-west1";
	    
	    String productSetId = "productSetId-001"; 
	    String productSetDisplayName = "productSetDisplayName-001";
	    
	    String productId = "productId-01";
	    String productDisplayName = "productDisplayName-01"; //실제 클라이언트에게 보여지는 제품명. 검색에도 사용됨
	    
	    String productCategory = "apparel-v2";
	    String productLabels = "";
	    
	    String referenceImageId = "referenceImageId-01"; 
	    String gcsUri = "gs://project_swdo/glasses1.jpg"; //스토리지 버켓에 저장된 상품 이미지의 gcs 주소. 
		
	    String filePath = "";
	    String filter = ""; //null값으로 고정
	    
	    
	    //실제로 웹사이트 상에서 사용되는 API
	    ProductSearch.createProduct(projectId, computeRegion, productId, productDisplayName, productCategory);   
	    ProductSearch.addProductToProductSet(projectId, computeRegion, productId, productSetId);  
	    ProductSearch.createReferenceImage(projectId, computeRegion, productId, referenceImageId, gcsUri);  
	    ProductSearch.getSimilarProductsFile(projectId, computeRegion, productSetId, productCategory, filePath, filter);	    
	    ProductSearch.listProducts(projectId, computeRegion);  
	    ProductSearch.deleteProduct(projectId, computeRegion, productId);
	    
	    // 프로젝트 실행 전 우선 해야하는 작업. productSetId는 하나만 고정하여 사용한다. 
	    ProductSearch.createProductSet(projectId, computeRegion, productSetId, productSetDisplayName);	    
	  	    	    
	    //기타 Vision API
	    PurgeProductsInProductSet.purgeProductsInProductSet(projectId, location, productSetId);	    
	    PurgeProducts.purgeOrphanProducts(projectId, computeRegion);
	    ProductSearch.removeProductFromProductSet(projectId, computeRegion, productId, productSetId);
	    ProductSearch.deleteProductSet(projectId, computeRegion, productSetId);
	    
	    ProductSearch.getProduct(projectId, computeRegion, productId);	
	    ProductSearch.getReferenceImage(projectId, computeRegion, productId, referenceImageId);	
	    ProductSearch.getProductSet(projectId, computeRegion, productSetId);
	    
	    ProductSearch.listProductsInProductSet(projectId, computeRegion, productSetId);	    
	    ProductSearch.listProductSets(projectId, computeRegion);	    
	    ProductSearch.listReferenceImagesOfProduct(projectId, computeRegion, productId);	
	    ProductSearch.listProducts(projectId, computeRegion);
   
	}
}
