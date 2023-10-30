package com.mmm.clout.imageservice.image.domain;

import com.sun.istack.NotNull;
import lombok.*;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.Where;

import javax.persistence.*;
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

    @NotNull
    @Column(name = "image_name")
    private String imageName;

    @NotNull
    @Column(name = "type")
    private String type;

    @NotNull
    @Column(name = "target_id")
    private Long targetId;

    @Column(name = "deleted_at") // 기본값 null
    private LocalDateTime deletedAt;
}
