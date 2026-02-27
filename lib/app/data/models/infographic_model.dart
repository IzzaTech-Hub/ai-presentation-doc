class InfographicModel {
  final String htmlCode;
  final String cssCode;
  final String prompt;

  InfographicModel({
    required this.htmlCode,
    required this.cssCode,
    required this.prompt,
  });

  factory InfographicModel.fromJson(Map<String, dynamic> json) {
    return InfographicModel(
      htmlCode: json['html'] ?? '',
      cssCode: json['css'] ?? '',
      prompt: json['prompt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'html': htmlCode, 'css': cssCode, 'prompt': prompt};
  }

  String get combinedHtml =>
      '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Infographic</title>
    <!-- Use Font Awesome 6.x -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Load common aesthetic fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&family=Outfit:wght@300;400;600;800&family=Poppins:wght@300;400;600;800&family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
        }
        
        body {
            margin: 0;
            padding: 0;
            width: 100vw;
            min-height: 100vh;
            overflow-x: hidden;
            background-color: #f7fafc;
            display: flex;
            flex-direction: column;
            align-items: center;
            font-family: 'Inter', 'Outfit', 'Poppins', sans-serif;
        }
        
        /* Base container to ensure centering and mobile width */
        .infographic-wrapper {
            width: 100%;
            max-width: 95vw;
            margin: 0 auto;
            padding: 20px 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }
        
        $cssCode
    </style>
</head>
<body>
    <div class="infographic-wrapper">
        $htmlCode
    </div>
</body>
</html>
''';
}
