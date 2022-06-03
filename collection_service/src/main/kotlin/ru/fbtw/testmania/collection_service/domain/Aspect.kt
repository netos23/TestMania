package ru.fbtw.testmania.collection_service.domain

import javax.persistence.*

@Entity
@Table(name = "aspect")
class Aspect(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    var id: Int?,

    @Column(name = "name")
    var name: String,

    @ManyToMany(
        cascade = [CascadeType.ALL],
//        fetch = FetchType.EAGER,
    )
    @JoinTable(
        name = "aspect_data_resource",
        joinColumns = [JoinColumn(name = "aspect_id", referencedColumnName = "id")],
        inverseJoinColumns = [JoinColumn(name = "data_resource_id", referencedColumnName = "id")],
    )
    var resources: MutableList<DataResource>,


    @ManyToMany(
        cascade = [CascadeType.ALL],
//        fetch = FetchType.EAGER,
    )
    @JoinTable(
        name = "aspect_steppers",
        joinColumns = [JoinColumn(name = "aspect_id", referencedColumnName = "id")],
        inverseJoinColumns = [JoinColumn(name = "stepper_step_id", referencedColumnName = "id")],
    )
    var steppers: MutableList<StepperStep>,
)
