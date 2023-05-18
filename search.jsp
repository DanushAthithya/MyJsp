<html>
    <head>
        <style>
            body{
                background-color: aqua;
            }
            input{
                width: 30%;
                border: solid black;
            }
            [type='submit']{
                border-top-left-radius: 5%;
                border-top-right-radius: 5%;
                border-bottom-left-radius: 5%;
                border-bottom-right-radius: 5%;
                background-color: rgb(224, 230, 144);
            }
        </style>
    </head>
    <body>
        <form action="ex8_2.jsp" method="get">
            <label for="movie">
                Movie Name:
                <input type="text" name="movie" id="movie"><br><br>
            </label>
            <input type="submit">
            <br><br>
        </form>
    </body>
</html>