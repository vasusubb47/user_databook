use rocket::{self, get, routes};
use dotenv::{dotenv, var};
use crate::database::pg_db_connection;


mod database;

//* Database Connection and DB Pool creation *//


#[get("/")]
fn index() -> String {
    "Hello World".to_string()
}

//* Rocket Configuration *//

#[rocket::main]
async fn main() -> Result<(), rocket::Error> {
    //* load the ENV variables
    dotenv().ok();

    let db_url = var("DATABASE_URL").expect("Couldn't find database url from environment variable.");

    let app_data = database::AppData {
        pg_conn: pg_db_connection(&db_url).await.expect(""),
    };

    let _rocket = rocket::build()
    .configure(rocket::Config::figment().merge(("port", 8888)))
    .manage(app_data)
    .mount("/", routes![index])
    .launch()
    .await?;

    Ok(())
}
