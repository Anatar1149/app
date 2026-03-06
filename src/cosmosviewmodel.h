#pragma once

#include "cosmosrepository.h"

#include <QObject>
#include <QVariantMap>

class CosmosViewModel final : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantList lessons READ lessons CONSTANT)
    Q_PROPERTY(int currentIndex READ currentIndex NOTIFY currentIndexChanged)
    Q_PROPERTY(QVariantMap currentLesson READ currentLesson NOTIFY currentIndexChanged)

public:
    explicit CosmosViewModel(QObject *parent = nullptr);

    [[nodiscard]] QVariantList lessons() const;
    [[nodiscard]] int currentIndex() const;
    [[nodiscard]] QVariantMap currentLesson() const;

    Q_INVOKABLE void nextLesson();
    Q_INVOKABLE void previousLesson();

signals:
    void currentIndexChanged();

private:
    CosmosRepository m_repository;
    QVariantList m_lessons;
    int m_currentIndex{0};
};
