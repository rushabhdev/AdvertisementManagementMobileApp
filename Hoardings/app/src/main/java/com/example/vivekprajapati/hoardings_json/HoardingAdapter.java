package com.example.vivekprajapati.hoardings_json;

import android.app.Activity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by Vivek Prajapati on 12/02/2017.
 */

public class HoardingAdapter extends BaseAdapter {

    Activity a;
    ArrayList<HashMap<String, String>> arrayList = new ArrayList<>();
    LayoutInflater layoutInflater;

    HoardingAdapter(Activity a, ArrayList<HashMap<String, String>> arrayList) {
        this.a = a;
        this.arrayList = arrayList;
        layoutInflater = a.getLayoutInflater();
    }

    @Override
    public int getCount() {
        return arrayList.size();
    }

    @Override
    public Object getItem(int position) {
        return arrayList.get(position);
    }

    @Override
    public long getItemId(int position) {
        return 0;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        if (convertView == null) {
            convertView = layoutInflater.inflate(R.layout.row_hoarding, null);
        }
        TextView tvHoardingName = (TextView) convertView.findViewById(R.id.tvHoardingName);
        TextView tvHoardingHeight = (TextView) convertView.findViewById(R.id.tvHoardingHeight);
        TextView tvHoardingPrice = (TextView) convertView.findViewById(R.id.tvHoardingPrice);
        TextView tvLocationId = (TextView) convertView.findViewById(R.id.tvLocationId);
        ImageView ivHoardingImage = (ImageView) convertView.findViewById(R.id.ivHoardingImage);
        HashMap<String, String> hashMap = arrayList.get(position);
        Picasso.with(a).load(jsonParser.HOARDING_IMAGE_URL + hashMap.get(HoardingActivity.TAG_HOARDING_IMAGE).replace(" ", "%20")).into(ivHoardingImage);
        tvHoardingName.setText(hashMap.get(HoardingActivity.TAG_HOARDING_NAME));
        tvHoardingHeight.setText(hashMap.get(HoardingActivity.TAG_HOARDING_HEIGHT) + " * " + hashMap.get(HoardingActivity.TAG_HOARDING_WIDTH));
        tvHoardingPrice.setText(hashMap.get(HoardingActivity.TAG_HOARDING_PRICE));
        tvLocationId.setText(hashMap.get(HoardingActivity.TAG_LOCATION_ID));
        return convertView;
    }
}
