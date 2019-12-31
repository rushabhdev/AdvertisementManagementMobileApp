package com.example.vivekprajapati.hoardings_json;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

import org.w3c.dom.Text;

public class AboutUsActivity extends AppCompatActivity {

    TextView tvaboutustitle, tvaboutusdesc;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().getTitle();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setContentView(R.layout.activity_about_us);
        tvaboutustitle=(TextView)findViewById(R.id.tvaboutustitle);
        tvaboutusdesc=(TextView)findViewById(R.id.tvaboutusdesc);
    }
}
