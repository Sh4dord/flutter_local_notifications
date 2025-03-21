package com.dexterous.flutterlocalnotifications.utils;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import java.util.Objects;
import androidx.annotation.Keep;

import com.dexterous.flutterlocalnotifications.models.ImageShape;


@Keep
public class BitmapUtils {

    public static Bitmap createShapedBitmap(Bitmap bitmap, ImageShape imageShape) {
        if(imageShape == ImageShape.Rounded) {
            return createRoundedBitmap(bitmap);
        }
        if(imageShape == ImageShape.Circular) {
            return createCircularBitmap(bitmap);
        }
        return bitmap;
    }

    public static Bitmap createCircularBitmap(Bitmap bitmap) {
        int size = Math.min(bitmap.getWidth(), bitmap.getHeight());
        Bitmap output = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);

        Canvas canvas = new Canvas(output);
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        float radius = size / 2f;
        canvas.drawCircle(radius, radius, radius, paint);

        paint.setXfermode(new android.graphics.PorterDuffXfermode(android.graphics.PorterDuff.Mode.SRC_IN));
        canvas.drawBitmap(bitmap, -(bitmap.getWidth() - size) / 2f, -(bitmap.getHeight() - size) / 2f, paint);

        return output;
    }

    public static Bitmap createRoundedBitmap(Bitmap bitmap) {
        int size = Math.min(bitmap.getWidth(), bitmap.getHeight());

        Bitmap output = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(output);

        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        paint.setColor(android.graphics.Color.WHITE);

        RectF rect = new RectF(0, 0, size, size);
        Path path = new Path();
        path.addRoundRect(rect, size * 0.2f, size * 0.2f, Path.Direction.CW);
        canvas.drawPath(path, paint);

        paint.setXfermode(new android.graphics.PorterDuffXfermode(android.graphics.PorterDuff.Mode.SRC_IN));
        float left = -(bitmap.getWidth() - size) / 2f;
        float top = -(bitmap.getHeight() - size) / 2f;
        canvas.drawBitmap(bitmap, left, top, paint);

        return output;
    }

}
