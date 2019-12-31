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
 * Created by Vivek Prajapati on 14/02/2017.
 */

public class UserAdapter extends BaseAdapter {

    Activity a;
    ArrayList<HashMap<String, String>> arrayList=new ArrayList<>();;
    LayoutInflater layoutInflater;

     UserAdapter(Activity a, ArrayList<HashMap<String, String>> arrayList){
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
        if(convertView==null){
            convertView=layoutInflater.inflate(R.layout.row_user,null);
        }
        TextView tvUserName = (TextView) convertView.findViewById(R.id.tvUserName);
        TextView tvUserAddress = (TextView) convertView.findViewById(R.id.tvUserAddress);
        TextView tvUserPassword = (TextView) convertView.findViewById(R.id.tvUserPassword);
        TextView tvUserEmail = (TextView) convertView.findViewById(R.id.tvUserEmail);
        TextView tvUserGender = (TextView) convertView.findViewById(R.id.tvUserGender);
        TextView tvUserMobile = (TextView) convertView.findViewById(R.id.tvUserMobile);
        TextView tvLocationId = (TextView) convertView.findViewById(R.id.tvLocationId);

        HashMap<String, String> hashMap = arrayList.get(position);

        tvUserName.setText(hashMap.get(UserActivity.TAG_USER_NAME));
        tvUserAddress.setText(hashMap.get(UserActivity.TAG_USER_ADDRESS));
        tvUserPassword.setText(hashMap.get(UserActivity.TAG_USER_PASSWORD));
        tvUserEmail.setText(hashMap.get(UserActivity.TAG_USER_EMAIL));
        tvUserGender.setText(hashMap.get(UserActivity.TAG_USER_GENDER));
        tvUserMobile.setText(hashMap.get(UserActivity.TAG_USER_MOBILE));
        tvLocationId.setText(hashMap.get(UserActivity.TAG_LOCATION_ID));
        return convertView;
    }
}
