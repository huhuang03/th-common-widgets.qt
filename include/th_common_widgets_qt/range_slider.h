#pragma once

#include <QWidget>
#include <QPainter>
#include <QMouseEvent>

class RangeSlider final : public QWidget
{
    Q_OBJECT
public:
    enum Option {
        NoHandle = 0x0,
        LeftHandle = 0x1,
        RightHandle = 0x2,
        DoubleHandles = LeftHandle | RightHandle
    };

    Q_DECLARE_FLAGS(Options, Option)

    explicit RangeSlider( QWidget* aParent = Q_NULLPTR);
    explicit RangeSlider( Qt::Orientation ori, Options t = DoubleHandles, QWidget* aParent = Q_NULLPTR);

    [[nodiscard]] QSize minimumSizeHint() const override;

    [[nodiscard]] int GetMinimum() const;
    void SetMinimum(int aMinimum);

    [[nodiscard]] int GetMaximum() const;
    void SetMaximum(int aMaximum);

    [[nodiscard]] int GetLowerValue() const;
    void SetLowerValue(int aLowerValue);

    [[nodiscard]] int GetUpperValue() const;
    void SetUpperValue(int aUpperValue);

    void SetRange(int aMinimum, int aMaximum);

    void SetCanOver(bool canOver);

protected:
    void paintEvent(QPaintEvent* aEvent) override;
    void mousePressEvent(QMouseEvent* aEvent) override;
    void mouseMoveEvent(QMouseEvent* aEvent) override;
    void mouseReleaseEvent(QMouseEvent* aEvent) override;
    void changeEvent(QEvent* aEvent) override;

    [[nodiscard]] QRectF firstHandleRect() const;
    [[nodiscard]] QRectF secondHandleRect() const;
    [[nodiscard]] QRectF handleRect(int aValue) const;

signals:
    void lowerValueChanged(int aLowerValue);
    void upperValueChanged(int aUpperValue);
    void valueChanged(int lower, int upper);
    void rangeChanged(int aMin, int aMax);

public slots:
    void setLowerValue(int aLowerValue);
    void setUpperValue(int aUpperValue);
    void setMinimum(int aMinimum);
    void setMaximum(int aMaximum);

private:
    Q_DISABLE_COPY(RangeSlider)
    [[nodiscard]] int validLength() const;

    bool canOver;
    int mMinimum;
    int mMaximum;
    int mLowerValue;
    int mUpperValue;
    bool mFirstHandlePressed;
    bool mSecondHandlePressed;
    int mInterval;
    int mDelta;
    QColor mBackgroundColorEnabled;
    QColor mBackgroundColorDisabled;
    QColor mBackgroundColor;
    Qt::Orientation orientation;
    Options type;

    // helper method;
    void drawSelect(QPainter &painter, QRectF &backgroundRect, int lower, int upper) const;
    [[nodiscard]] double getLeftByValue(int value) const;
};

Q_DECLARE_OPERATORS_FOR_FLAGS(RangeSlider::Options)