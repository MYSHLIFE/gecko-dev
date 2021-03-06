
/*
 * Copyright 2012 Google Inc.
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

#ifndef SkLinearGradient_DEFINED
#define SkLinearGradient_DEFINED

#include "SkGradientShaderPriv.h"

class SkLinearGradient : public SkGradientShaderBase {
public:
    SkLinearGradient(const SkPoint pts[2], const Descriptor&);

    virtual bool setContext(const SkBitmap&, const SkPaint&, const SkMatrix&) SK_OVERRIDE;
    virtual void shadeSpan(int x, int y, SkPMColor dstC[], int count) SK_OVERRIDE;
    virtual void shadeSpan16(int x, int y, uint16_t dstC[], int count) SK_OVERRIDE;
    virtual BitmapType asABitmap(SkBitmap*, SkMatrix*, TileMode*) const SK_OVERRIDE;
    virtual GradientType asAGradient(GradientInfo* info) const SK_OVERRIDE;
    virtual GrEffectRef* asNewEffect(GrContext* context, const SkPaint&) const SK_OVERRIDE;

    SK_DEVELOPER_TO_STRING()
    SK_DECLARE_PUBLIC_FLATTENABLE_DESERIALIZATION_PROCS(SkLinearGradient)

protected:
    SkLinearGradient(SkReadBuffer& buffer);
    virtual void flatten(SkWriteBuffer& buffer) const SK_OVERRIDE;

private:
    typedef SkGradientShaderBase INHERITED;
    const SkPoint fStart;
    const SkPoint fEnd;
};

#endif
