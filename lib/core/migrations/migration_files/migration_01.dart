import 'package:shamo/core/migrations/base/migration_base.dart';
import 'package:sqflite/sqflite.dart';

class Migration01 extends MigrationBase {
  @override
  Future<void> import(Database database) async {
    await database.execute("CREATE TABLE order_data_and_detail("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "transaction_detail_jumlah TEXT,"
        "transaction_detail_price TEXT,"
        "transaction_detail_total_price TEXT,"
        "transaction_detail_use_addon TEXT,"
        "transaction_detail_price_modal TEXT, "
        "transaction_detail_catatan TEXT,"
        "transaction_detail_pajak_produk TEXT,"
        "transaction_detail_total_pajak_produk TEXT,"
        "id_item TEXT,"
        "item_name TEXT,"
        "id_promo TEXT,"
        "transaction_promo_value TEXT,"
        "transaction_promo_type TEXT,"
        "transaction_recipe_detail TEXT,"
        "transaction_addon_detail_add TEXT,"
        "transaction_detail_diskon_nominal TEXT,"
        "transaction_detail_diskon_percent TEXT,"
        "transaction_detail_use_recipe TEXT,"
        "transaction_commission TEXT,"
        "id_cabang TEXT,"
        "no_payment TEXT"
        ")");
  }
}
