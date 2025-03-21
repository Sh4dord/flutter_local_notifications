package com.dexterous.flutterlocalnotifications.models;

import androidx.annotation.Keep;

import java.io.Serializable;

@Keep
public class PersonDetails implements Serializable {
  public Boolean bot;
  public Object icon;
  public IconSource iconBitmapSource;
  public ImageShape iconBitmapShape;
  public Boolean important;
  public String key;
  public String name;
  public String uri;

  public PersonDetails(
      Boolean bot,
      Object icon,
      IconSource iconSource,
      ImageShape imageShape,
      Boolean important,
      String key,
      String name,
      String uri) {
    this.bot = bot;
    this.icon = icon;
    this.iconBitmapShape = imageShape;
    this.iconBitmapSource = iconSource;
    this.important = important;
    this.key = key;
    this.name = name;
    this.uri = uri;
  }
}
