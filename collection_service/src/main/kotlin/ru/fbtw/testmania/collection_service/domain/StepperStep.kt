package ru.fbtw.testmania.collection_service.domain

import javax.persistence.*

@Entity
@Table(name = "stepper_step")
class StepperStep(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    var id: Int?,

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "stepper_tag")
    var stepperTag: Int,

    @Column(name = "stepper_index")
    var index:Int,

    @ManyToOne
    @JoinColumn(name="data_resource_id", nullable=false)
    var dataResource: DataResource,
)
