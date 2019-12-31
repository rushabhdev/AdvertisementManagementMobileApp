package com.example.vivekprajapati.hoardings_json;

import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.view.View;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.AdapterView;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Timer;
import java.util.TimerTask;

public class HomeActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener {
    SharedPreferences sharedPreferences;
    int[] IMAGE_IDS = {R.drawable.commerce_ahd, R.drawable.himalaya_mall1, R.drawable.busshelter, R.drawable.rixa_ahm1};
    public int currentimageindex = 0;
    Timer timer;
    TimerTask task;
    ImageView r1;

    GridView gvHoardingHome;
    ArrayList<HashMap<String, String>> arrayList = new ArrayList<>();
    public static final String TAG = "Hoarding";
    public static final String TAG_HOARDING_ID = "Hoarding_Id";
    public static final String TAG_HOARDING_NAME = "Hoarding_Name";
    public static final String TAG_HOARDING_ADDRESS = "Hoarding_Address";
    public static final String TAG_LOCATION_ID = "Location_Id";
    public static final String TAG_HOARDINGTYPE_ID = "HoardingType_Id";
    public static final String TAG_HOARDING_HEIGHT = "Hoarding_Height";
    public static final String TAG_HOARDING_WIDTH = "Hoarding_Width";
    public static final String TAG_HOARDING_PRICE = "Hoarding_Price";
    public static final String TAG_HOARDING_IMAGE = "Hoarding_Image";
    ProgressDialog progressDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        gvHoardingHome = (GridView) findViewById(R.id.gvHoardingHome);
        new getHoarding().execute();

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.setDrawerListener(toggle);
        toggle.syncState();
        sharedPreferences = getSharedPreferences("MyFile", 0);
        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        if (sharedPreferences.getString(LoginActivity.TAG_USER_ID, "").equals("")) {
            navigationView.inflateMenu(R.menu.activity_home_drawer);
        } else {
            navigationView.inflateMenu(R.menu.activity_home_drawer_with_login);
        }
        View header = navigationView.getHeaderView(0);
        TextView tvUname = (TextView) header.findViewById(R.id.tvUname);
        tvUname.setText("WelCome , " + sharedPreferences.getString(LoginActivity.TAG_USER_NAME, "User"));
        navigationView.setNavigationItemSelectedListener(this);

        final Handler mHandler = new Handler();
        // Create runnable for posting
        final Runnable mUpdateResults = new Runnable() {
            public void run() {
                AnimateandSlideShow();
            }
        };
        int delay = 1000; // delay for 1 sec.
        int period = 2000; // repeat every 4 sec.
        Timer timer = new Timer();
        timer.scheduleAtFixedRate(new TimerTask() {
            public void run() {
                mHandler.post(mUpdateResults);
            }
        }, delay, period);
    }

    public void onClick(View v) {
        // finish();
        android.os.Process.killProcess(android.os.Process.myPid());
    }

    private void AnimateandSlideShow() {
        r1 = (ImageView) findViewById(R.id.ivSlider);
        if (currentimageindex >= IMAGE_IDS.length)
            currentimageindex = 0;
        r1.setBackgroundResource(IMAGE_IDS[currentimageindex]);
        currentimageindex++;
    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        if (id == R.id.nav_aboutus) {
            startActivity(new Intent(HomeActivity.this, AboutUsActivity.class));
        } else if (id == R.id.nav_home) {
            startActivity(new Intent(HomeActivity.this, HomeActivity.class));
            finish();
        } else if (id == R.id.nav_contact) {
            startActivity(new Intent(HomeActivity.this, ContactUs.class));
        } else if (id == R.id.nav_login) {
            startActivity(new Intent(HomeActivity.this, LoginActivity.class));

        } else if (id == R.id.nav_logout) {
            startActivity(new Intent(HomeActivity.this, HomeActivity.class));
            SharedPreferences.Editor e = sharedPreferences.edit();
            e.clear();
            e.commit();
            finish();
        } else if (id == R.id.nav_category) {
            startActivity(new Intent(HomeActivity.this, HoardingType.class));
        } else if (id == R.id.nav_bookings) {
            startActivity(new Intent(HomeActivity.this, BookingActivity.class));
        } else if (id == R.id.nav_payments) {
            startActivity(new Intent(HomeActivity.this, PaymentActivity.class));
        } else if (id == R.id.nav_change_password) {
            startActivity(new Intent(HomeActivity.this, ChangePasswordActivity.class));
        } else if (id == R.id.nav_cart) {
            startActivity(new Intent(HomeActivity.this, ViewCart.class));
        } else if (id == R.id.nav_feedback) {
            startActivity(new Intent(HomeActivity.this, FeedbackActivity.class));
        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

    class getHoarding extends AsyncTask<Void, Void, Void> {


        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(HomeActivity.this);
            progressDialog.setMessage("Hold on For A Moment...");
            progressDialog.show();
        }

        @Override
        protected Void doInBackground(Void... params) {
            String json = jsonParser.invokeJSON("getHoardingHome"); // this will let android studio know that it needs to fetch data from getEmployee Method.
            try {
                JSONObject jsonObject = new JSONObject(json);
                JSONArray jsonArray = jsonObject.getJSONArray(TAG);
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject jsonObject1 = jsonArray.getJSONObject(i);
                    HashMap<String, String> hashMap = new HashMap<>();
                    hashMap.put(TAG_HOARDING_ID, jsonObject1.getString(TAG_HOARDING_ID)); // change name
                    hashMap.put(TAG_HOARDING_NAME, jsonObject1.getString(TAG_HOARDING_NAME));
                    hashMap.put(TAG_HOARDING_ADDRESS, jsonObject1.getString(TAG_HOARDING_ADDRESS)); // change name
                    hashMap.put(TAG_LOCATION_ID, jsonObject1.getString(TAG_LOCATION_ID));
                    hashMap.put(TAG_HOARDINGTYPE_ID, jsonObject1.getString(TAG_HOARDINGTYPE_ID));
                    hashMap.put(TAG_HOARDING_HEIGHT, jsonObject1.getString(TAG_HOARDING_HEIGHT));
                    hashMap.put(TAG_HOARDING_WIDTH, jsonObject1.getString(TAG_HOARDING_WIDTH));
                    hashMap.put(TAG_HOARDING_PRICE, jsonObject1.getString(TAG_HOARDING_PRICE));
                    hashMap.put(TAG_HOARDING_IMAGE, jsonObject1.getString(TAG_HOARDING_IMAGE));
                    arrayList.add(hashMap);
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            return null;
        }

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
            HoardingAdapter hoardingAdapter = new HoardingAdapter(HomeActivity.this, arrayList);
            gvHoardingHome.setAdapter(hoardingAdapter);
            gvHoardingHome.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                    Intent i = new Intent(HomeActivity.this, HoardingDetailsActivity.class);
                    i.putExtra(TAG_HOARDING_ID, arrayList.get(position).get(TAG_HOARDING_ID));
                    startActivity(i);
                }
            });
            progressDialog.dismiss();
        }
    }
}