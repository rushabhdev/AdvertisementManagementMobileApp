package com.example.vivekprajapati.hoardings_json;

import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.SpannableString;
import android.text.style.UnderlineSpan;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONException;
import org.json.JSONObject;

import static com.example.vivekprajapati.hoardings_json.UserActivity.TAG_USER_ID;
import static com.example.vivekprajapati.hoardings_json.UserActivity.TAG_USER_PASSWORD;

public class LoginActivity extends AppCompatActivity implements View.OnClickListener {

    EditText etUserEmail, etUserPassword;
    Button btnlogin;
    TextView tvRegistration,tvforgotpassword;
    ProgressDialog progressDialog;
    SharedPreferences s1;
    public static final String TAG_USER_ID = "User_Id";
    public static final String TAG_USER_NAME= "User_Name";
    public static final String TAG_USER_PASSWORD = "User_Password";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().getTitle();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setContentView(R.layout.activity_login);
        initialize();

    }

    void initialize() {
        s1 = getSharedPreferences("MyFile", 0);
        etUserEmail = (EditText) findViewById(R.id.etUserEmail);
        etUserPassword = (EditText) findViewById(R.id.etUserPassword);
        btnlogin = (Button) findViewById(R.id.btnlogin);
        btnlogin.setOnClickListener(this);

        tvRegistration = (TextView)findViewById(R.id.tvRegistration);
        SpannableString content = new SpannableString("Create an account? Register");
        content.setSpan(new UnderlineSpan(), 0, content.length(), 0);
        tvRegistration.setText(content);
        tvRegistration.setOnClickListener(this);

        tvforgotpassword = (TextView)findViewById(R.id.tvforgotpassword);
        SpannableString content1 = new SpannableString("Forgot Password ?");
        content.setSpan(new UnderlineSpan(), 0, content.length(), 0);
        tvforgotpassword.setText(content1);
        tvforgotpassword.setOnClickListener(this);
    }

    class Login extends AsyncTask<Void, Void, Void> {
        JSONObject jsonObject;


        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(LoginActivity.this);
            progressDialog.setMessage("Logging in Please Wait");
            progressDialog.show();
        }

        @Override
        protected Void doInBackground(Void... params) {
            String json = jsonParser.invokeJSON("login", "query", "Select * from [User] where User_Email = '" + etUserEmail.getText().toString() + "' and User_Password='" + etUserPassword.getText().toString() + "'");
            try {
                jsonObject = new JSONObject(json);
            } catch (JSONException e) {
                e.printStackTrace();
            }
            return null;
        }

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
            try {
                if (!jsonObject.getString(TAG_USER_ID).equals("null")) { //THIS BLOCK IS FOR SETTINNG PARAMETERS FOR WHICH USER IS LOGGED IN.
                    SharedPreferences.Editor e = s1.edit();  //upar declare karyu 6 object
                    e.putString(TAG_USER_ID, jsonObject.getString(TAG_USER_ID));
                    e.putString(TAG_USER_NAME, jsonObject.getString(TAG_USER_NAME));
                    e.putString(TAG_USER_PASSWORD, jsonObject.getString(TAG_USER_PASSWORD));
                    e.commit();
                    startActivity(new Intent(LoginActivity.this, HomeActivity.class));
                } else {
                    Toast.makeText(LoginActivity.this, "Invalid login details", Toast.LENGTH_SHORT).show();
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            progressDialog.dismiss();
        }
    }

    @Override
    public void onClick(View v) {
        Intent i,i1;
        switch (v.getId()) {
            case R.id.btnlogin:
                new Login().execute();
                break;
            case R.id.tvRegistration:
                i = new Intent(LoginActivity.this, RegestrationActivity.class);
                startActivity(i);
                break;

            case R.id.tvforgotpassword:
                i1 = new Intent(LoginActivity.this, Forgot_Password.class);
                startActivity(i1);
                break;
        }
    }
}
