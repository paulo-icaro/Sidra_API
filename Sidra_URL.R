# ================================ #
# === URL FUNCTION - SIDRA API === #
# ================================ #

# --- Script by Paulo Icaro --- #

# See https://apisidra.ibge.gov.br/home/ajuda for more info on how to create your query



# ------------------------------ #
# --- URL Generator Function --- #
# ------------------------------ #
sidra_url = function(table, time_interval, variables, territorial_perspective, territorial_level, kind, headers, fields, decimals){
  
  # --- Base URL --- #
  base_url = "https://apisidra.ibge.gov.br/values/t/"
  
  # --- Exclusionary Required Arguments Flag --- #
  if(!missing(territorial_perspective) && (!missing(territorial_level))){
    stop(
      paste0(
      '\nArgumentos Visão Territorial e Nível Territorial não podem ser especificados simultaneamente. Especifique apenas um dos critérios.',
      '\nCaso esteja em dúvidas sobre como montar sua consulta acesse: https://apisidra.ibge.gov.br/home/ajuda'))
    }
  
  
  # --- Arguments --- #
  
  # Time Interval (Required)
  if(!missing(time_interval)){time_interval = paste0('/p/', time_interval)} else {time_interval = '/p/last'}
  
  # Variables Name (Optional)
  if(!missing(variables)){variables =  paste0('/v/', variables)} else {variables = '/v/all'}
  
  # Territorial Perspective (Optional)
  if(!missing(territorial_perspective)){territorial_perspective = paste0('/g/', territorial_perspective)} else {territorial_perspective = NULL}
  
  # Territorial Level (Optional)
  if(missing(territorial_level)){territorial_level = NULL} else {territorial_level = paste0('/', territorial_level)}
  
  # Header (Optional)
  if(missing(headers)){headers = NULL} else {headers = paste0('/', header)}
  
  # Field (Optional)
  if(missing(fields)){fields = NULL} else {fields = paste0('/', fields)}
  
  # Decimal Places (Optional)
  if(missing(decimals)){decimals = NULL} else if (!decimals %in% list('s', 'm') || !decimals %in% seq_along(0:9)){decimals = paste0('/d/', decimals)} else {stop('Quantidade de casas decimais inválidas !')}
  
  # --- Generate URL --- #
  sidra_url = paste0(base_url, table, time_interval, variables, territorial_perspective, territorial_level, headers, fields, decimals, '?formato=json')
  
  
  # --- Output --- #
  return(sidra_url)
}