package com.example.vivekprajapati.hoardings_json;

import android.app.Activity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by Vivek Prajapati on 06/02/2017.
 */

public class CityAdapter extends BaseAdapter {
    Activity a;
    ArrayList<HashMap<String,String>>arrayList=new ArrayList<>();
    LayoutInflater layoutInflater;

    CityAdapter(Activity a,ArrayList<HashMap<String,String>>arrayList){
        this.a=a;
        this.arrayList=arrayList;
        layoutInflater=a.getLayoutInflater();

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
        if(convertView==null){
            convertView=layoutInflater.inflate(R.layout.row_city,null);
        }
        TextView tvCityName=(TextView)convertView.findViewById(R.id.tvCityName);
        HashMap<String,String>hashMap=arrayList.get(position);
        tvCityName.setText(hashMap.get(CityActivity.TAG_CITY_NAME ));


        return convertView;
    }
}
