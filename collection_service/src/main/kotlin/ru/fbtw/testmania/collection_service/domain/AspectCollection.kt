package ru.fbtw.testmania.collection_service.domain

import javax.persistence.*


@Entity
@Table(name = "collection")
class AspectCollection(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private var id: Int,

    @Column(name = "name")
    var name: String,

    @ManyToMany
    @JoinTable(
        name = "aspect collection",
        joinColumns = [JoinColumn(name = "collection_id", referencedColumnName = "id")],
        inverseJoinColumns = [JoinColumn(name = "aspect_id", referencedColumnName = "id")],
    )
    var aspects: MutableList<Aspect>,
)