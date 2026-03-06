#include "cosmosrepository.h"

CosmosRepository::CosmosRepository(QObject *parent)
    : QObject(parent)
{
}

QVariantList CosmosRepository::lessons() const
{
    return {
        QVariantMap{
            {"title", "The Sun"},
            {"subtitle", "Our stellar engine"},
            {"description", "A G-type main-sequence star that contains over 99.8% of the Solar System's mass."},
            {"distance", "149.6 million km from Earth"},
            {"imageUrl", "https://upload.wikimedia.org/wikipedia/commons/c/c3/Solar_sys8.jpg"},
            {"accent", "#FDB813"}
        },
        QVariantMap{
            {"title", "The Milky Way"},
            {"subtitle", "Our galactic home"},
            {"description", "A barred spiral galaxy with hundreds of billions of stars and an estimated diameter of 100,000 light-years."},
            {"distance", "Solar System is ~27,000 light-years from center"},
            {"imageUrl", "https://upload.wikimedia.org/wikipedia/commons/6/60/Milky_Way_Galaxy.jpg"},
            {"accent", "#7AA5FF"}
        },
        QVariantMap{
            {"title", "Orion Nebula"},
            {"subtitle", "A stellar nursery"},
            {"description", "One of the brightest diffuse nebulae, where stars are actively forming within glowing gas clouds."},
            {"distance", "~1,344 light-years from Earth"},
            {"imageUrl", "https://upload.wikimedia.org/wikipedia/commons/d/d4/Great_Orion_Nebula_-_Hubble_2006_mosaic_18000.jpg"},
            {"accent", "#B77BFF"}
        }
    };
}
