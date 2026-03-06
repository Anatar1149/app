#pragma once

#include <QObject>
#include <QVariantList>

class CosmosRepository final : public QObject
{
    Q_OBJECT

public:
    explicit CosmosRepository(QObject *parent = nullptr);

    [[nodiscard]] QVariantList lessons() const;
};
