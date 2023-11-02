create_cluster_summary_tibble <- function(data, cluster_number) {
  # Filter the row based on the cluster number
  row <- dplyr::filter(data, Cluster == as.character(cluster_number))
  
  # Extract the values
  jumlah_kecamatan <- row$`Jumlah kecamatan`
  luas_ha <- row$`Luas (Ha)`
  rumah_tangga <- row$`Rumah Tangga`
  kepadatan_rt <- row$`Kepadatan Rumah Tangga (RT/Ha)`
  
  # Extract the percentages
  percent_luas <- row$`% Luas`
  percent_rumah_tangga <- row$`% Rumah Tangga`
  
  # Create the tibble
  summary_tibble <- tibble::tribble(
    ~"", ~Nilai, ~Persentase,
    "Jumlah kecamatan", jumlah_kecamatan, percent_luas,
    "Luas (Ha)", luas_ha, percent_luas,
    "Rumah Tangga", rumah_tangga, percent_rumah_tangga,
    "Kepadatan Rumah Tangga (RT/Ha)", kepadatan_rt, NA_character_
  )
  
  return(summary_tibble)
}