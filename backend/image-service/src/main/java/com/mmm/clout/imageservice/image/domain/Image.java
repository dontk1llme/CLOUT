package com.mmm.clout.imageservice.image.domain;

import com.sun.istack.NotNull;
import lombok.*;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.Where;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

@Getter
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@SuperBuilder
@DynamicInsert
@Table(name = "image", indexes = @Index(name = "idx__type", columnList = "type"))
@Where(clause = "deleted_at is null")
@Entity
public class Image {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @NotNull
    @Column(name = "original_name")
    private String originalName;

    @NotNull
    @Column(name = "path")
    private String path;

    @NotBlank
    @Column(name = "image_name")
    private String imageName;
    //시간 + 난수생성 + 오리지널

    @NotNull
    @Column(name = "type")
    private String type;

    @NotNull
    @Column(name = "target_id")
    private Long targetId;


    public Image(Long targetId, String originalName, String path, String imageName, String type) {
        this.targetId = targetId;
        this.type = type;
        this.path = path;
        this.imageName = imageName;
        this.originalName = originalName;
    }

    public static Image create(
            Long targetId,
            String originalName,
            String path,
            String imageName,
            String type
    ){
        return new Image(
                targetId,
                originalName,
                path,
                imageName,
                type
        );
    }
}
