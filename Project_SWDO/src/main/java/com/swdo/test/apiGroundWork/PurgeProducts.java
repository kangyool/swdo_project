package com.swdo.test.apiGroundWork;

import com.google.api.gax.longrunning.OperationFuture;
import com.google.cloud.vision.v1.LocationName;
import com.google.cloud.vision.v1.ProductSearchClient;
import com.google.cloud.vision.v1.PurgeProductsRequest;
import java.util.concurrent.TimeUnit;

public class PurgeProducts {

  // Delete the product and all its reference images.
  public static void purgeOrphanProducts(String projectId, String computeRegion) throws Exception {

    // String projectId = "YOUR_PROJECT_ID";
    // String computeRegion = "us-central1";
    // boolean force = true;

    try (ProductSearchClient client = ProductSearchClient.create()) {
      String parent = LocationName.format(projectId, computeRegion);

      // The purge operation is async.
      PurgeProductsRequest request =
          PurgeProductsRequest.newBuilder()
              .setDeleteOrphanProducts(true)
              // The operation is irreversible and removes multiple products.
              // The user is required to pass in force=True to actually perform the
              // purge.
              // If force is not set to True, the service raises an exception.
              .setForce(true)
              .setParent(parent)
              .build();

      OperationFuture response = client.purgeProductsAsync(request);
      response.getPollingFuture().get(180, TimeUnit.SECONDS);

      System.out.println("Orphan products deleted.");
    }
  }
}