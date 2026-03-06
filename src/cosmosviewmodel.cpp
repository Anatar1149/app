#include "cosmosviewmodel.h"

CosmosViewModel::CosmosViewModel(QObject *parent)
    : QObject(parent),
      m_repository(this),
      m_lessons(m_repository.lessons())
{
}

QVariantList CosmosViewModel::lessons() const
{
    return m_lessons;
}

int CosmosViewModel::currentIndex() const
{
    return m_currentIndex;
}

QVariantMap CosmosViewModel::currentLesson() const
{
    if (m_lessons.isEmpty()) {
        return {};
    }

    return m_lessons.at(m_currentIndex).toMap();
}

void CosmosViewModel::nextLesson()
{
    if (m_lessons.isEmpty()) {
        return;
    }

    m_currentIndex = (m_currentIndex + 1) % m_lessons.size();
    emit currentIndexChanged();
}

void CosmosViewModel::previousLesson()
{
    if (m_lessons.isEmpty()) {
        return;
    }

    m_currentIndex = (m_currentIndex - 1 + m_lessons.size()) % m_lessons.size();
    emit currentIndexChanged();
}
