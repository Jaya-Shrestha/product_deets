# product_deets

## Overview

This project is a mobile and desktop-responsive application that displays product details. It features a dynamic and responsive layout for both mobile and desktop users. The app uses riverpod for state management and fetches product data to display key details like product images, price, description, and more.

## Install Dependencies

flutter pub get

## Run the Application

flutter run

flutter run -d chrome

flutter run -d macos # Replace with windows or linux for those platforms

## Project Structure

softbenz-task/
├── lib/
│ ├── main.dart # Entry point of the app
│ ├── pages/
│ │ └── product_detail_page.dart # Product detail page layout
│ ├── providers/
│ │ └── product_provider.dart # Riverpod provider for fetching product data
│ ├── widgets/
│ │ ├── color_selector_widget.dart # Color selection widget
│ │ ├── expansion_tile_widget.dart # Expansion tile widget
│ │ ├── images_widget.dart # Widget to display product images
│ │ ├── quantity_field.dart # Widget for selecting quantity
│ │ └── title_value_widget.dart # Widget to display title-value pairs
│ └── utils/
│ └── responsive_layout.dart # Utilities for responsive design
├── pubspec.yaml # Project dependencies and configurations
└── README.md # Project documentation
