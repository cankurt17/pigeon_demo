package com.ahmeddhus.pigeon_demo;

import java.util.Collections;
import java.util.List;

import io.flutter.plugins.Pigeon.*;
import io.flutter.embedding.android.FlutterActivity;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.FlutterEngine;

public class MainActivity extends FlutterActivity {
    class MyApi implements BookApi {

        @NonNull
        @Override
        public List<Book> search(@NonNull String keyword) {
            Book book = new Book();
            book.setAuthor(keyword);
            book.setTitle(String.format("Life %s", keyword));

            return Collections.singletonList(book);
        }
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        BookApi.setup(flutterEngine.getDartExecutor(), new MyApi());
    }
}
