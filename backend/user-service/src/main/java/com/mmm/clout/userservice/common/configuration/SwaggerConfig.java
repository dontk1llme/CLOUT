//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.bind.annotation.RestController;
//
//@Configuration
//@EnableOpenApi
//public class OpenApiConfig {
//
//    @Bean
//    public Docket api() {
//        return new Docket(io.swagger.v3.oas.models.OpenAPI
//            .Parser.newBuilder()
//            .readTimeout(1000)
//            .build())
//            .select()
//            .apis(RequestHandlerSelectors.withClassAnnotation(RestController.class)) // RestController 어노테이션을 가진 클래스만 문서화
//            .paths(PathSelectors.any())
//            .build()
//            .apiInfo(apiInfo());
//    }
//
//    @Bean
//    public UiConfiguration uiConfig() {
//        return UiConfigurationBuilder.builder()
//            .defaultModelsExpandDepth(-1)
//            .build();
//    }
//
//    private ApiInfo apiInfo() {
//        return new ApiInfoBuilder()
//            .title("Your API Title")
//            .description("Your API Description")
//            .version("1.0.0")
//            .build();
//    }
//}