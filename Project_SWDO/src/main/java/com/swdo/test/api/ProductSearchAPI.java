package com.swdo.test.api;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageContext;
import com.google.cloud.vision.v1.Product;
import com.google.cloud.vision.v1.ProductName;
import com.google.cloud.vision.v1.ProductSearchClient;
import com.google.cloud.vision.v1.ProductSearchParams;
import com.google.cloud.vision.v1.ReferenceImage;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.ProductSearchResults.Result;
import com.google.protobuf.ByteString;
import com.swdo.test.service.ProductService;
import com.swdo.test.vo.ProductVO;

public class ProductSearchAPI {
	
	@Autowired
	private ProductService service;
	
	//------------------ Google Vision API -------------------------
	
	public static ArrayList<Product> listProducts(String projectId, String computeRegion) throws IOException {
		  try (ProductSearchClient client = ProductSearchClient.create()) {

		    // A resource that represents Google Cloud Platform location.
		    String formattedParent = ProductSearchClient.formatLocationName(projectId, computeRegion);

		    // List all the products available in the region.
		    
		    ArrayList<Product> result = new ArrayList<Product>();
		      
		    for (Product product : client.listProducts(formattedParent).iterateAll()) {
		      // Display the product information
		      System.out.println(String.format("\nProduct name: %s", product.getName()));
		      System.out.println(
		          String.format(
		              "Product id: %s",
		              product.getName().substring(product.getName().lastIndexOf('/') + 1)));
		      System.out.println(String.format("Product displayName: %s", product.getDisplayName()));
		      System.out.println(String.format("Product category: %s", product.getProductCategory()));
		      System.out.println("Product labels:");
		      System.out.println(
		          String.format("Product labels: %s", product.getProductLabelsList().toString()));
		      
		       result.add(product);
		    }
		    
		    return result;
		  }
		}	
	
	public static void deleteProduct(String projectId, String computeRegion, String productId)
		    throws IOException {
		  try (ProductSearchClient client = ProductSearchClient.create()) {

		    // Get the full path of the product.
		    String formattedName =
		        ProductSearchClient.formatProductName(projectId, computeRegion, productId);

		    // Delete a product.
		    client.deleteProduct(formattedName);
		    System.out.println("Product deleted.");
		  }
		}
	
	public static ArrayList<String> getSimilarProductsFile(
		      String projectId,
		      String computeRegion,
		      String productSetId,
		      String productCategory,
		      String filePath,
		      String filter)
		      throws IOException {
		
	      
		    //제품 정보를 저장하기 위한 arrayList 선언 
		    ArrayList<String> result = new ArrayList<String>();
		    

	      
		    try (ImageAnnotatorClient queryImageClient = ImageAnnotatorClient.create()) {

		      // Get the full path of the product set.
		      String productSetPath =
		          ProductSearchClient.formatProductSetName(projectId, computeRegion, productSetId);

		      // Read the image as a stream of bytes.
		      File imgPath = new File(filePath);
		      byte[] content = Files.readAllBytes(imgPath.toPath());

		      // Create annotate image request along with product search feature.
		      Feature featuresElement = Feature.newBuilder().setType(Type.PRODUCT_SEARCH).build();
		      // The input image can be a HTTPS link or Raw image bytes.
		      // Example:
		      // To use HTTP link replace with below code
		      //  ImageSource source = ImageSource.newBuilder().setImageUri(imageUri).build();
		      //  Image image = Image.newBuilder().setSource(source).build();
		      Image image = Image.newBuilder().setContent(ByteString.copyFrom(content)).build();
		      ImageContext imageContext =
		          ImageContext.newBuilder()
		              .setProductSearchParams(
		                  ProductSearchParams.newBuilder()
		                      .setProductSet(productSetPath)
		                      .addProductCategories(productCategory)
		                      .setFilter(filter))
		              .build();

		      AnnotateImageRequest annotateImageRequest =
		          AnnotateImageRequest.newBuilder()
		              .addFeatures(featuresElement)
		              .setImage(image)
		              .setImageContext(imageContext)
		              .build();
		      List<AnnotateImageRequest> requests = Arrays.asList(annotateImageRequest);

		      // Search products similar to the image.
		      BatchAnnotateImagesResponse response = queryImageClient.batchAnnotateImages(requests);
		      
		      List<Result> similarProducts =
		          response.getResponses(0).getProductSearchResults().getResultsList();
		      System.out.println(String.format("입력 이미지 : %s", filePath));
		      System.out.println("Similar Products: ");
		      for (Result product : similarProducts) {
		        System.out.println(String.format("\nProduct name: %s", product.getProduct().getName()));
		        System.out.println(
		            String.format("Product display name: %s", product.getProduct().getDisplayName()));
		        System.out.println(
		            String.format("Product description: %s", product.getProduct().getDescription()));
		        System.out.println(String.format("Score(Confidence): %s", product.getScore()));
		        System.out.println(String.format("Image name: %s", product.getImage()));
		        
		        //제품 아이디를 추출하기 위한 문자열 처리1
		        int index = product.getProduct().getName().lastIndexOf("/");
		        
		        //제품 정보를 result에 저장
		        if(product.getScore() >= 0.30)
		        	result.add(product.getProduct().getName().substring(index+1));
		      }
		    }
		    
		    //result 반환
		    return result;
	}
	
	public static void addProductToProductSet(ProductVO product)
		    throws IOException {
		  try (ProductSearchClient client = ProductSearchClient.create()) {

		    // Get the full path of the product set.
		    String formattedName =
		        ProductSearchClient.formatProductSetName(product.getProjectId(), product.getComputeRegion(), product.getProductSetId());
		    
		    // Get the full path of the product.
		    String productPath = ProductName.of(product.getProjectId(), product.getComputeRegion(), product.getProductId()).toString();

		    // Add the product to the product set.
		    client.addProductToProductSet(formattedName, productPath);

		    System.out.println(String.format("Product added to product set."));
		  }
		}
	
	public static void createReferenceImage(ProductVO product)
		    throws IOException {
		  try (ProductSearchClient client = ProductSearchClient.create()) {

		    // Get the full path of the product.
		    String formattedParent =
		        ProductSearchClient.formatProductName(product.getProjectId(), product.getComputeRegion(), product.getProductId());
		    // Create a reference image.
		    ReferenceImage referenceImage = ReferenceImage.newBuilder().setUri(product.getGcsUri()).build();

		    ReferenceImage image =
		        client.createReferenceImage(formattedParent, referenceImage, product.getReferenceImageId());
		    // Display the reference image information.
		    System.out.println(String.format("Reference image name: %s", image.getName()));
		    System.out.println(String.format("Reference image uri: %s", image.getUri()));
		  }
		}
	
	
	public static void createProduct(ProductVO product)
		    throws IOException {
		
		try (ProductSearchClient client = ProductSearchClient.create()) {

		    // A resource that represents Google Cloud Platform location.
		    String formattedParent = ProductSearchClient.formatLocationName(product.getProjectId(), product.getComputeRegion());
		    // Create a product with the product specification in the region.
		    // Multiple labels are also supported.
		    Product myProduct =
		        Product.newBuilder()
		            .setName(product.getProjectId())
		            .setDisplayName(product.getProductDisplayName())
		            .setProductCategory(product.getProductCategory())
		            .build();
		    Product prod = client.createProduct(formattedParent, myProduct, product.getProductId());
		    // Display the product information
		    System.out.println(String.format("Product name: %s", prod.getName()));
		  }
		  
		  ProductSearchAPI.addProductToProductSet(product);
		  ProductSearchAPI.createReferenceImage(product);
 
	}
}
