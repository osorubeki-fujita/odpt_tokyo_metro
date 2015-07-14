# それぞれの具体的な情報を統括するクラスのメタクラス（複数の YAML ファイルを扱うクラス）
class TokyoMetro::Static::Fundamental::MetaClass::UsingMultipleYamls
  include ::TokyoMetro::Modules::ToFactory::Static::Generate::Group::MultipleYamls
end