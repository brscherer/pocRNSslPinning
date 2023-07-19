package com.pocrnsslpinning;

import com.facebook.react.modules.network.OkHttpClientFactory;
import com.facebook.react.modules.network.OkHttpClientProvider;
import okhttp3.CertificatePinner;
import okhttp3.OkHttpClient;

public class SSLPinningFactory implements OkHttpClientFactory {
   private static String hostname = "api.github.com";

   public OkHttpClient createNewNetworkModuleClient() {

      CertificatePinner certificatePinner = new CertificatePinner.Builder()
        .add(hostname, "sha256/XVzYYir7lwzFXd7VWMBOsk8ys3YZYDKYiJrDo/5LuTU=")
        .build();

      OkHttpClient.Builder clientBuilder = OkHttpClientProvider.createClientBuilder();
      return clientBuilder.certificatePinner(certificatePinner).build();
  }
}