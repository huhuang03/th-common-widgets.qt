#pragma once
#include <QtGlobal>

#if defined(TH_COMMON_WIDGETS_QT_BUILD)
#  define TH_COMMON_WIDGETS_QT_API Q_DECL_EXPORT
#else
#  define TH_COMMON_WIDGETS_QT_API Q_DECL_IMPORT
#endif
