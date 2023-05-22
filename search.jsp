<html>
    <head>
        <style>
            body{
                background-color: rgb(22, 37, 96);
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: center;
                color: white;
            }
            input{
                min-width: 20vw;
                padding: 2%;
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
                Player Name:
                <input type="text" name="name" id="movie"><br><br>
            </label>
            <input type="submit">
            <br><br>
        </form>
    </body>
</html>