package com.swdo.test.apiGroundWork;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.CreateProductSetRequest;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageContext;
import com.google.cloud.vision.v1.ImageName;
import com.google.cloud.vision.v1.Product;
import com.google.cloud.vision.v1.Product.KeyValue;
import com.google.cloud.vision.v1.ProductName;
import com.google.cloud.vision.v1.ProductSearchClient;
import com.google.cloud.vision.v1.ProductSearchParams;
import com.google.cloud.vision.v1.ProductSearchResults.Result;
import com.google.cloud.vision.v1.ProductSet;
import com.google.cloud.vision.v1.ReferenceImage;
import com.google.protobuf.ByteString;
import com.google.protobuf.FieldMask;
import com.swdo.test.vo.ProductVO;

@Controller
public class ProductSearch {
	
	/**
	 * Delete the product and all its reference images.
	 *
	 * @param projectId - Id of the project.
	 * @param computeRegion - Region name.
	 * @param productId - Id of the product.
	 * @throws IOException - on I/O errors.
	 */
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
	
	/**
	 * List all products.
	 *
	 * @param projectId - Id of the project.
	 * @param computeRegion - Region name.
	 * @throws IOException - on I/O errors.
	 */
	public static void listProducts(String projectId, String computeRegion) throws IOException {
	  try (ProductSearchClient client = ProductSearchClient.create()) {

	    // A resource that represents Google Cloud Platform location.
	    String formattedParent = ProductSearchClient.formatLocationName(projectId, computeRegion);

	    // List all the products available in the region.
	    for (Product product : client.listProducts(formattedParent).iterateAll()) {
	      // Display the product information
	      System.out.println(String.format("\nProduct name: %s", product.getName()));
	      System.out.println(
	          String.format(
	              "Product id: %s",
	              product.getName().substring(product.getName().lastIndexOf('/') + 1)));
	      System.out.println(String.format("Product display name: %s", product.getDisplayName()));
	      System.out.println(String.format("Product category: %s", product.getProductCategory()));
	      System.out.println("Product labels:");
	      System.out.println(
	          String.format("Product labels: %s", product.getProductLabelsList().toString()));
	    }
	  }
	}
	
	
	/**
	 * Create a product set
	 *
	 * @param projectId - Id of the project.
	 * @param computeRegion - Region name.
	 * @param productSetId - Id of the product set.
	 * @param productSetDisplayName - Display name of the product set.
	 * @throws IOException - on I/O errors.
	 */
	public static void createProductSet(
		    String projectId, String computeRegion, String productSetId, String productSetDisplayName)
		    throws IOException {
		  try (ProductSearchClient client = ProductSearchClient.create()) {

		    // A resource that represents Google Cloud Platform location.
		    String formattedParent = ProductSearchClient.formatLocationName(projectId, computeRegion);

		    // Create a product set with the product set specification in the region.
		    ProductSet myProductSet =
		        ProductSet.newBuilder().setDisplayName(productSetDisplayName).build();
		    CreateProductSetRequest request =
		        CreateProductSetRequest.newBuilder()
		            .setParent(formattedParent)
		            .setProductSet(myProductSet)
		            .setProductSetId(productSetId)
		            .build();
		    ProductSet productSet = client.createProductSet(request);
		    // Display the product set information
		    System.out.println(String.format("Product set name: %s", productSet.getName()));
		  }
		}
	
	
	/**
	 * Create one product.
	 *
	 * @param projectId - Id of the project.
	 * @param computeRegion - Region name.
	 * @param productId - Id of the product.
	 * @param productDisplayName - Display name of the product.
	 * @param productCategory - Category of the product.
	 * @throws IOException - on I/O errors.
	 */
	public static void createProduct(
	    String projectId,
	    String computeRegion,
	    String productId,
	    String productDisplayName,
	    String productCategory)
	    throws IOException {
	  try (ProductSearchClient client = ProductSearchClient.create()) {

	    // A resource that represents Google Cloud Platform location.
	    String formattedParent = ProductSearchClient.formatLocationName(projectId, computeRegion);
	    // Create a product with the product specification in the region.
	    // Multiple labels are also supported.
	    Product myProduct =
	        Product.newBuilder()
	            .setName(productId)
	            .setDisplayName(productDisplayName)
	            .setProductCategory(productCategory)
	            .build();
	    Product product = client.createProduct(formattedParent, myProduct, productId);
	    // Display the product information
	    System.out.println(String.format("Product name: %s", product.getName()));
	  }
	}
	
	 /**
	   * Update the product labels.
	   *
	   * @param projectId - Id of the project.
	   * @param computeRegion - Region name.
	   * @param productId -Id of the product.
	   * @param productLabels - Labels of the product.
	   * @throws IOException - on I/O errors.
	   */
	  public static void updateProductLabels(
	      String projectId, String computeRegion, String productId, String productLabels)
	      throws IOException {
	    try (ProductSearchClient client = ProductSearchClient.create()) {

	      // Get the full path of the product.
	      String formattedName =
	          ProductSearchClient.formatProductName(projectId, computeRegion, productId);

	      // Set product name, product labels and product display name.
	      // Multiple labels are also supported.
	      Product product =
	          Product.newBuilder()
	              .setName(formattedName)
	              .addProductLabels(
	                  KeyValue.newBuilder()
	                      .setKey(productLabels.split(",")[0].split("=")[0])
	                      .setValue(productLabels.split(",")[0].split("=")[1])
	                      .build())
	              .build();

	      // Set product update field name.
	      FieldMask updateMask = FieldMask.newBuilder().addPaths("product_labels").build();

	      // Update the product.
	      Product updatedProduct = client.updateProduct(product, updateMask);
	      // Display the product information
	      System.out.println(String.format("Product name: %s", updatedProduct.getName()));
	      System.out.println(String.format("Updated product labels: "));
	      for (Product.KeyValue element : updatedProduct.getProductLabelsList()) {
	        System.out.println(String.format("%s: %s", element.getKey(), element.getValue()));
	      }
	    }
	  }
	
	
	/**
	 * Add a product to a product set.
	 *
	 * @param projectId - Id of the project.
	 * @param computeRegion - Region name.
	 * @param productId - Id of the product.
	 * @param productSetId - Id of the product set.
	 * @throws IOException - on I/O errors.
	 */
	  public static void addProductToProductSet(
			    String projectId, String computeRegion, String productId, String productSetId)
			    throws IOException {
			  try (ProductSearchClient client = ProductSearchClient.create()) {

			    // Get the full path of the product set.
			    String formattedName =
			        ProductSearchClient.formatProductSetName(projectId, computeRegion, productSetId);
			    
			    System.out.println(formattedName);
			    
			    // Get the full path of the product.
			    String productPath = ProductName.of(projectId, computeRegion, productId).toString();

			    System.out.println(productPath);

			    // Add the product to the product set.
			    client.addProductToProductSet(formattedName, productPath);

			    System.out.println(String.format("Product added to product set."));
			  }
			}
	  
	  /**
	   * Delete a product set.
	   *
	   * @param projectId - Id of the project.
	   * @param computeRegion - Region name.
	   * @param productSetId - Id of the product set.
	   * @throws IOException - on I/O errors.
	   */
	  public static void deleteProductSet(String projectId, String computeRegion, String productSetId)
	      throws IOException {
	    try (ProductSearchClient client = ProductSearchClient.create()) {

	      // Get the full path of the product set.
	      String formattedName =
	          ProductSearchClient.formatProductSetName(projectId, computeRegion, productSetId);
	      // Delete the product set.
	      client.deleteProductSet(formattedName);
	      System.out.println(String.format("Product set deleted"));
	    }
	  }
	
	  /**
	   * Get info about the product set.
	   *
	   * @param projectId - Id of the project.
	   * @param computeRegion - Region name.
	   * @param productSetId - Id of the product set.
	   * @throws IOException - on I/O errors.
	   */
	  public static void getProductSet(String projectId, String computeRegion, String productSetId)
	      throws IOException {
	    try (ProductSearchClient client = ProductSearchClient.create()) {

	      // Get the full path of the product set.
	      String formattedName =
	          ProductSearchClient.formatProductSetName(projectId, computeRegion, productSetId);
	      // Get complete detail of the product set.
	      ProductSet productSet = client.getProductSet(formattedName);
	      // Display the product set information
	      System.out.println(String.format("Product set name: %s", productSet.getName()));
	      System.out.println(
	          String.format(
	              "Product set id: %s",
	              productSet.getName().substring(productSet.getName().lastIndexOf('/') + 1)));
	      System.out.println(
	          String.format("Product set display name: %s", productSet.getDisplayName()));
	      System.out.println("Product set index time:");
	      System.out.println(String.format("\tseconds: %s", productSet.getIndexTime().getSeconds()));
	      System.out.println(String.format("\tnanos: %s", productSet.getIndexTime().getNanos()));
	    }
	  }
	
	/**
	 * Remove a product from a product set.
	 *
	 * @param projectId - Id of the project.
	 * @param computeRegion - Region name.
	 * @param productId - Id of the product.
	 * @param productSetId - Id of the product set.
	 * @throws IOException - on I/O errors.
	 */
	public static void removeProductFromProductSet(
	    String projectId, String computeRegion, String productId, String productSetId)
	    throws IOException {
	  try (ProductSearchClient client = ProductSearchClient.create()) {

	    // Get the full path of the product set.
	    String formattedParent =
	        ProductSearchClient.formatProductSetName(projectId, computeRegion, productSetId);

	    // Get the full path of the product.
	    String formattedName =
	        ProductSearchClient.formatProductName(projectId, computeRegion, productId);

	    // Remove the product from the product set.
	    client.removeProductFromProductSet(formattedParent, formattedName);

	    System.out.println(String.format("Product removed from product set."));
	  }
	}
	
	/**
	   * Get information about a product.
	   *
	   * @param projectId - Id of the project.
	   * @param computeRegion - Region name.
	   * @param productId - Id of the product.
	   * @throws IOException - on I/O errors.
	   */
	  public static void getProduct(String projectId, String computeRegion, String productId)
	      throws IOException {
	    try (ProductSearchClient client = ProductSearchClient.create()) {

	      // Get the full path of the product.
	      String formattedName =
	          ProductSearchClient.formatProductName(projectId, computeRegion, productId);
	      // Get complete detail of the product.
	      Product product = client.getProduct(formattedName);
	      // Display the product information
	      System.out.println(String.format("Product name: %s", product.getName()));
	      System.out.println(
	          String.format(
	              "Product id: %s",
	              product.getName().substring(product.getName().lastIndexOf('/') + 1)));
	      System.out.println(String.format("Product display name: %s", product.getDisplayName()));
	      System.out.println(String.format("Product description: %s", product.getDescription()));
	      System.out.println(String.format("Product category: %s", product.getProductCategory()));
	      System.out.println(String.format("Product labels: "));
	      for (Product.KeyValue element : product.getProductLabelsList()) {
	        System.out.println(String.format("%s: %s", element.getKey(), element.getValue()));
	      }
	    }
	  }
	
	
	
	
	
	/**
	 * Create a reference image.
	 *
	 * @param projectId - Id of the project.
	 * @param computeRegion - Region name.
	 * @param productId - Id of the product.
	 * @param referenceImageId - Id of the image.
	 * @param gcsUri - Google Cloud Storage path of the input image.
	 * @throws IOException - on I/O errors.
	 */
	public static void createReferenceImage(
	    String projectId,
	    String computeRegion,
	    String productId,
	    String referenceImageId,
	    String gcsUri)
	    throws IOException {
	  try (ProductSearchClient client = ProductSearchClient.create()) {

	    // Get the full path of the product.
	    String formattedParent =
	        ProductSearchClient.formatProductName(projectId, computeRegion, productId);
	    // Create a reference image.
	    ReferenceImage referenceImage = ReferenceImage.newBuilder().setUri(gcsUri).build();

	    ReferenceImage image =
	        client.createReferenceImage(formattedParent, referenceImage, referenceImageId);
	    // Display the reference image information.
	    System.out.println(String.format("Reference image name: %s", image.getName()));
	    System.out.println(String.format("Reference image uri: %s", image.getUri()));
	  }
	}
	
	
	/**
	 * Search similar products to image in local file.
	 *
	 * @param projectId - Id of the project.
	 * @param computeRegion - Region name.
	 * @param productSetId - Id of the product set.
	 * @param productCategory - Category of the product.
	 * @param filePath - Local file path of the image to be searched
	 * @param filter - Condition to be applied on the labels. Example for filter: (color = red OR
	 *     color = blue) AND style = kids It will search on all products with the following labels:
	 *     color:red AND style:kids color:blue AND style:kids
	 * @throws IOException - on I/O errors.
	 */
	 public static void getSimilarProductsFile(
		      String projectId,
		      String computeRegion,
		      String productSetId,
		      String productCategory,
		      String filePath,
		      String filter)
		      throws IOException {
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
		      System.out.println("Similar Products: ");
		      for (Result product : similarProducts) {
		        System.out.println(String.format("\nProduct name: %s", product.getProduct().getName()));
		        System.out.println(
		            String.format("Product display name: %s", product.getProduct().getDisplayName()));
		        System.out.println(
		            String.format("Product description: %s", product.getProduct().getDescription()));
		        System.out.println(String.format("Score(Confidence): %s", product.getScore()));
		        System.out.println(String.format("Image name: %s", product.getImage()));
		      }
		    }
		  }
	 
	 		
	 		
	 /**
	  * List all product sets
	  *
	  * @param projectId - Id of the project.
	  * @param computeRegion - Region name.
	  * @throws IOException - on I/O errors.
	  */
	 public static void listProductSets(String projectId, String computeRegion) throws IOException {
	   try (ProductSearchClient client = ProductSearchClient.create()) {
	     // A resource that represents Google Cloud Platform location.
	     String formattedParent = ProductSearchClient.formatLocationName(projectId, computeRegion);
	     // List all the product sets available in the region.
	     for (ProductSet productSet : client.listProductSets(formattedParent).iterateAll()) {
	       // Display the product set information
	       System.out.println(String.format("Product set name: %s", productSet.getName()));
	       System.out.println(
	           String.format(
	               "Product set id: %s",
	               productSet.getName().substring(productSet.getName().lastIndexOf('/') + 1)));
	       System.out.println(
	           String.format("Product set display name: %s", productSet.getDisplayName()));
	       System.out.println("Product set index time:");
	       System.out.println(String.format("\tseconds: %s", productSet.getIndexTime().getSeconds()));
	       System.out.println(String.format("\tnanos: %s", productSet.getIndexTime().getNanos()));
	     }
	   }
	 }
	 
	 /**
	  * List all products in a product set.
	  *
	  * @param projectId - Id of the project.
	  * @param computeRegion - Region name.
	  * @param productSetId - Id of the product set.
	  * @throws IOException - on I/O errors.
	  */
	 public static void listProductsInProductSet(
	     String projectId, String computeRegion, String productSetId) throws IOException {
	   try (ProductSearchClient client = ProductSearchClient.create()) {

	     // Get the full path of the product set.
	     String formattedName =
	         ProductSearchClient.formatProductSetName(projectId, computeRegion, productSetId);
	     // List all the products available in the product set.
	     for (Product product : client.listProductsInProductSet(formattedName).iterateAll()) {
	       // Display the product information
	       System.out.println(String.format("Product name: %s", product.getName()));
	       System.out.println(
	           String.format(
	               "Product id: %s",
	               product.getName().substring(product.getName().lastIndexOf('/') + 1)));
	       System.out.println(String.format("Product display name: %s", product.getDisplayName()));
	       System.out.println(String.format("Product description: %s", product.getDescription()));
	       System.out.println(String.format("Product category: %s", product.getProductCategory()));
	       System.out.println("Product labels: ");
	       for (Product.KeyValue element : product.getProductLabelsList()) {
	         System.out.println(String.format("%s: %s", element.getKey(), element.getValue()));
	       }
	     }
	   }
	 }
	 
	 /**
	  * Get info about a reference image.
	  *
	  * @param projectId - Id of the project.
	  * @param computeRegion - Region name.
	  * @param productId - Id of the product.
	  * @param referenceImageId - Id of the image.
	  * @throws IOException - on I/O errors.
	  */
	 public static void getReferenceImage(
	     String projectId, String computeRegion, String productId, String referenceImageId)
	     throws IOException {
	   try (ProductSearchClient client = ProductSearchClient.create()) {

	     // Get the full path of the reference image.
	     String formattedName =
	         ImageName.format(projectId, computeRegion, productId, referenceImageId);
	     // Get complete detail of the reference image.
	     ReferenceImage image = client.getReferenceImage(formattedName);
	     // Display the reference image information.
	     System.out.println(String.format("Reference image name: %s", image.getName()));
	     System.out.println(
	         String.format(
	             "Reference image id: %s",
	             image.getName().substring(image.getName().lastIndexOf('/') + 1)));
	     System.out.println(String.format("Reference image uri: %s", image.getUri()));
	     System.out.println(
	         String.format(
	             "Reference image bounding polygons: %s \n", image.getBoundingPolysList().toString()));
	   }
	 }
	 
	 /**
	  * List all images in a product.
	  *
	  * @param projectId - Id of the project.
	  * @param computeRegion - Region name.
	  * @param productId - Id of the product.
	  * @throws IOException - on I/O errors.
	  */
	 public static void listReferenceImagesOfProduct(
	     String projectId, String computeRegion, String productId) throws IOException {
	   try (ProductSearchClient client = ProductSearchClient.create()) {

	     // Get the full path of the product.
	     String formattedParent =
	         ProductSearchClient.formatProductName(projectId, computeRegion, productId);
	     for (ReferenceImage image : client.listReferenceImages(formattedParent).iterateAll()) {
	       // Display the reference image information.
	       System.out.println(String.format("Reference image name: %s", image.getName()));
	       System.out.println(
	           String.format(
	               "Reference image id: %s",
	               image.getName().substring(image.getName().lastIndexOf('/') + 1)));
	       System.out.println(String.format("Reference image uri: %s", image.getUri()));
	       System.out.println(
	           String.format(
	               "Reference image bounding polygons: %s \n",
	               image.getBoundingPolysList().toString()));
	     }
	   }
	 }
	
	
}
