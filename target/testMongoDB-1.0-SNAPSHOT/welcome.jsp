<!DOCTYPE html>
<html>
<head>
  <title>Custom Searchable Dropdown</title>
  <!-- CSS -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
  <style>
    /* Additional CSS styling for div elements */
    .custom-div {
      display: none; /* Hide all div elements by default */
      margin: 10px;
      padding: 10px;
      border: 1px solid #ccc;
    }

    /* Styling for the searchable dropdown */
    .searchable-dropdown {
      position: relative;
      display: inline-block;
    }

    #searchInput {
      width: 200px;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    #dropdownOptions {
      list-style: none;
      margin: 0;
      padding: 0;
      display: none;
      position: absolute;
      background-color: #fff;
      border: 1px solid #ccc;
      z-index: 1;
      max-height: 150px;
      overflow-y: auto;
    }

    #dropdownOptions li {
      padding: 8px;
      cursor: pointer;
    }

    #dropdownOptions li:hover {
      background-color: #f1f1f1;
    }
  </style>
</head>
<body>
  <!-- Searchable Dropdown -->
  <div class="searchable-dropdown">
    <input type="text" id="searchInput" placeholder="Search...">
    <ul id="dropdownOptions">
      <li data-value="div1">Div 1</li>
      <li data-value="div2">Div 2</li>
      <li data-value="div3">Div 3</li>
      <!-- Add more options as needed -->
    </ul>
  </div>

  <!-- Div Elements to Choose Between -->
  <div id="div1" class="custom-div">Content for Div 1</div>
  <div id="div2" class="custom-div">Content for Div 2</div>
  <div id="div3" class="custom-div">Content for Div 3</div>
  <!-- Add more div elements as needed -->

  <!-- JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
    $(document).ready(function() {
      // Show/hide div elements based on the selected option
      $('#dropdownOptions li').on('click', function () {
        var selectedValue = $(this).data('value');
        $('.custom-div').hide();
        $('#' + selectedValue).show();
      });

      // Filter dropdown options based on search input
      $('#searchInput').on('input', function () {
        var value = $(this).val().toLowerCase();
        $('#dropdownOptions li').filter(function() {
          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
      });

      // Toggle dropdown options visibility when clicking on the input
      $('#searchInput').on('focus', function() {
        $('#dropdownOptions').show();
      });

      $(document).on('click', function(e) {
        if ($(e.target).closest('#searchInput, #dropdownOptions').length === 0) {
          $('#dropdownOptions').hide();
        }
      });
    });
  </script>
</body>
</html>
