package ru.fbtw.testmania.collection_service.domain

import javax.persistence.*

@Entity
@Table(name = "data_resource")
class DataResource (
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    var id: Int?,

    @Column(name = "name")
    var name: String,

    @Column(name = "type")
    @Enumerated(EnumType.STRING)
    var type: ResourceType,
)

enum class ResourceType{
    DESCRIPTION,
    FACT,
    IMAGE,
    STEPPER_DATA,
}